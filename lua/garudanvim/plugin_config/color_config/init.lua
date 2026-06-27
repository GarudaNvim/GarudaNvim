-- colorschemes configuration goes here
require("garudanvim.plugin_config.color_config.onedarkpro")
require("garudanvim.plugin_config.color_config.dracula")
require("garudanvim.plugin_config.color_config.nordic")
require("garudanvim.plugin_config.color_config.tokyodark")
require("garudanvim.plugin_config.color_config.tokyonight")
require("garudanvim.plugin_config.color_config.catppuccin")
require("garudanvim.plugin_config.color_config.nightfox")
require("garudanvim.plugin_config.color_config.doomone")

local M = {}
M.transparent_mode = false

-- file used to persist transparency state across sessions
local state_file = vim.fn.stdpath("state") .. "/garudanvim_transparent"

local function save_state()
	local f = io.open(state_file, "w")
	if f then
		f:write(M.transparent_mode and "true" or "false")
		f:close()
	end
end

local function load_state()
	local f = io.open(state_file, "r")
	if f then
		local content = f:read("*a")
		f:close()
		return content:match("true") ~= nil
	end
	return false
end

-- apply transparency to all relevant highlight groups
local function apply_transparency()
	local groups = {
		-- core editor
		"Normal",
		"NormalNC",
		"NormalFloat",
		"SignColumn",
		"EndOfBuffer",
		-- borders and floats
		"FloatBorder",
		"FloatTitle",
		-- status line base
		"StatusLine",
		"StatusLineNC",
		-- nvim-tree
		"NvimTreeNormal",
		"NvimTreeNormalNC",
		"NvimTreeEndOfBuffer",
		"NvimTreeWinSeparator",
		"NvimTreeStatusLine",
		"NvimTreeStatusLineNC",
		-- telescope
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
		"TelescopePromptBorder",
		"TelescopeResultsNormal",
		"TelescopeResultsBorder",
		"TelescopePreviewNormal",
		"TelescopePreviewBorder",
		-- barbar / tabline
		"TabLineFill",
		"BufferTabpageFill",
	}
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
	end
	-- lualine generates highlight groups dynamically; clear them all
	for _, name in ipairs(vim.fn.getcompletion("lualine_", "highlight")) do
		vim.api.nvim_set_hl(0, name, { bg = "NONE", ctermbg = "NONE" })
	end
end

-- toggle between transparent and opaque mode
function M.toggle_transparency()
	M.transparent_mode = not M.transparent_mode
	save_state()
	if M.transparent_mode then
		apply_transparency()
	else
		-- reset all highlights by re-running the active colorscheme
		vim.cmd.colorscheme(vim.g.colors_name)
	end
end

-- re-apply after colorscheme switch only when transparent mode is active
-- vim.schedule defers until after lualine has regenerated its own groups
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		if M.transparent_mode then
			vim.schedule(apply_transparency)
		end
	end,
})

-- colorscheme configuration
-- local colorscheme = "onedark_dark"
local colorscheme = "catppuccin-mocha"

-- calling the colorscheme command
local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return M
end

-- restore transparency state from previous session
M.transparent_mode = load_state()
if M.transparent_mode then
	vim.schedule(apply_transparency)
end

return M
