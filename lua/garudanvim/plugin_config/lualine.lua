-- attempt to load the lualine plugin
local status_ok, options = pcall(require, "lualine")
if not status_ok then
	return
end

-- define the project root component to display current working directory
local project_root = {
	function()
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":t") -- get directory name
	end,
	icon = "",       -- icon for the project root
	separator = "",   -- separator after project root
}

-- setup options for gitsigns
options.setup({
	options = {
		icons_enabled = true, -- enable icons in statusline
		theme = "auto",       -- automatically match theme
		component_separators = { left = "", right = "" }, -- separators between components
		section_separators = { left = "", right = "" },   -- separators between sections
		disabled_filetypes = {
			statusline = {},   -- disable lualine in specific filetypes for statusline
			winbar = {},       -- disable lualine in specific filetypes for winbar
		},
		ignore_focus = {},      -- list of filetypes to ignore
		always_divide_middle = true, -- always split statusline in the middle
		globalstatus = true,    -- single statusline across all windows
		refresh = {
			statusline = 1000, -- refresh statusline every 1000 ms
			tabline = 1000,    -- refresh tabline every 1000 ms
			winbar = 1000,     -- refresh winbar every 1000 ms
		},
	},

	sections = {
		lualine_a = { "mode" },                             -- shows current mode
		lualine_b = { "branch", "diff", "diagnostics" },    -- shows git branch, diff, and diagnostics
		lualine_c = {
			project_root,                                   -- shows current project root
			{ "filename", file_status = true, newfile_status = true, path = 1 }, -- shows filename with status
		},
		lualine_x = { "encoding", "fileformat", "filetype" }, -- shows encoding, format, and type
		lualine_y = { "progress" },                          -- shows progress in the file
		lualine_z = { "location" },                          -- shows cursor location
	},

	inactive_sections = {
		lualine_a = {},               -- no content for inactive a-section
		lualine_b = {},               -- no content for inactive b-section
		lualine_c = { "filename" },   -- only shows filename in inactive statusline
		lualine_x = { "location" },   -- shows cursor location in inactive statusline
		lualine_y = {},               -- no content for inactive y-section
		lualine_z = {},               -- no content for inactive z-section
	},

	tabline = {},       -- empty tabline configuration
	winbar = {},        -- empty winbar configuration
	inactive_winbar = {}, -- empty winbar configuration for inactive windows
	extensions = {},    -- no extensions enabled
})
