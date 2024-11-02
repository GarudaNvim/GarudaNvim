-- attempt to load the telescope plugin
local status_ok, options = pcall(require, "telescope")
if not status_ok then
	return
end

-- load the ui-select extension for telescope
options.load_extension("ui-select")

-- require telescope actions for convenient key mappings
local actions = require("telescope.actions")

-- setup options for telescope
options.setup({
	defaults = {
		-- default configuration for telescope goes here
		-- config_key = value,
		mappings = {
			i = { -- insert mode key mappings
				["<C-n>"] = actions.cycle_history_next,         -- move to next history entry
				["<C-p>"] = actions.cycle_history_prev,         -- move to previous history entry
				["<C-j>"] = actions.move_selection_next,         -- move selection down
				["<C-k>"] = actions.move_selection_previous,     -- move selection up
				["<C-c>"] = actions.close,                       -- close the telescope prompt
				["<Down>"] = actions.move_selection_next,        -- move selection down with down arrow
				["<Up>"] = actions.move_selection_previous,      -- move selection up with up arrow
				["<CR>"] = actions.select_default,               -- select the currently highlighted entry
				["<C-x>"] = actions.select_horizontal,           -- select and open horizontally
				["<C-v>"] = actions.select_vertical,             -- select and open vertically
				["<C-t>"] = actions.select_tab,                  -- select and open in a new tab
				["<C-u>"] = actions.preview_scrolling_up,        -- scroll up in the preview window
				["<C-d>"] = actions.preview_scrolling_down,      -- scroll down in the preview window
				["<PageUp>"] = actions.results_scrolling_up,     -- scroll up in results
				["<PageDown>"] = actions.results_scrolling_down, -- scroll down in results
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse, -- toggle selection and move down
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better, -- toggle selection and move up
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- send selected entries to quickfix list
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected entries to quickfix list
				["<C-l>"] = actions.complete_tag,               -- complete tags
				["<C-_>"] = actions.which_key,                   -- show key mappings
			},
			n = { -- normal mode key mappings
				["<esc>"] = actions.close,                      -- close the telescope prompt
				["q"] = actions.close,                          -- close with 'q' key
				["<CR>"] = actions.select_default,              -- select the currently highlighted entry
				["<C-x>"] = actions.select_horizontal,          -- select and open horizontally
				["<C-v>"] = actions.select_vertical,            -- select and open vertically
				["<C-t>"] = actions.select_tab,                 -- select and open in a new tab
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse, -- toggle selection and move down
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better, -- toggle selection and move up
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- send selected entries to quickfix list
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected entries to quickfix list
				["j"] = actions.move_selection_next,           -- move selection down with 'j'
				["k"] = actions.move_selection_previous,       -- move selection up with 'k'
				["H"] = actions.move_to_top,                   -- move to the top of the results
				["M"] = actions.move_to_middle,                -- move to the middle of the results
				["L"] = actions.move_to_bottom,                 -- move to the bottom of the results
				["<Down>"] = actions.move_selection_next,       -- move selection down with down arrow
				["<Up>"] = actions.move_selection_previous,     -- move selection up with up arrow
				["gg"] = actions.move_to_top,                   -- move to the top with 'gg'
				["G"] = actions.move_to_bottom,                 -- move to the bottom with 'G'
				["<C-u>"] = actions.preview_scrolling_up,       -- scroll up in the preview window
				["<C-d>"] = actions.preview_scrolling_down,     -- scroll down in the preview window
				["<PageUp>"] = actions.results_scrolling_up,    -- scroll up in results
				["<PageDown>"] = actions.results_scrolling_down, -- scroll down in results
				["?"] = actions.which_key,                      -- show key mappings
			},
		},
	},

	pickers = {
		-- default configuration for built-in pickers goes here
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- the picker_config_key will be applied every time you call this built-in picker
		colorscheme = {
			enable_preview = true,                       -- enable preview for colorscheme picker
		},
	},

	extensions = {
		["ui-select"] = {                               -- configuration for the ui-select extension
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
		-- extension configuration goes here
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- refer to the extension's README for configuration details
	},
})
