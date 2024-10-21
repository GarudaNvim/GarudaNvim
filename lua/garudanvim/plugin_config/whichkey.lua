local wk = require("which-key")

local mappings = {
	["e"] = { "<cmd> NvimTreeToggle <CR>", "Nvim Tree Toggle" },
  ["N"] = { "<cmd> enew <CR>", "New buffer" },
	["s"] = { "<cmd> w! <CR><CR>", "Save" },
	["q"] = { "<cmd> q! <CR>", "Quit" },
	["w"] = { "<cmd> BufferClose <CR>", "Close Buffer" },
	["f"] = { "<cmd> Telescope find_files <CR>", "Find files" },
	["p"] = { "<cmd> Telescope projects <CR>", "Projects" },
  ["t"] = { "<cmd> ToggleTerm direction=float <CR>", "Terminal" },


	-- Diagnostics
	d = {
		name = "Diagnostics",
		b = { "<cmd> Telescope diagnostics bufnr=0 <CR>", "Buffer Diagnostics" },
		p = { "<cmd> Telescope diagnostics <CR>", "Workspace Diagnostics" },
	},

	-- finding files/text etc
	F = {
		name = "Find",
		a = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find All" },
		l = { "<cmd> Telescope live_grep <CR>", "Find Text" },
		b = { "<cmd> Telescope buffers <CR>", "Find Buffers" },
		h = { "<cmd> Telescope help_tags <CR>", "Help Page" },
		o = { "<cmd> Telescope oldfiles <CR>", "Find Old Files" },
		k = { "<cmd> Telescope filetypes <CR>", "File Types" },
		c = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in Current Buffer" },
	},

  -- all terminals
	T = {
		name = "All Terminal",
		n = { "<cmd> lua _NODE_TOGGLE() <CR>", "Node" },
		t = { "<cmd> lua _HTOP_TOGGLE() <CR>", "Htop" },
		p = { "<cmd> lua _PYTHON_TOGGLE() <CR>", "Python" },
		h = { "<cmd> ToggleTerm size=20 direction=horizontal <CR>", "Horizontal" },
		v = { "<cmd> ToggleTerm size=70 direction=vertical <CR>", "Vertical" },
	},

	-- Git
	g = {
		name = "Git",
		s = { "<cmd> Telescope git_status <CR>", "Git Status" },
		b = { "<cmd> Telescope git_branches <CR>", "Git branches" },
		c = { "<cmd> Telescope git_commits <CR>", "Git commit" },
		f = { "<cmd> Telescope git_files <CR>", "Git files" },
		h = { "<cmd> Telescope git_stash <CR>", "Git stash" },
    g = { "<cmd> lua _LAZYGIT_TOGGLE() <CR>", "Lazygit" },
		j = { "<cmd> lua require 'gitsigns'.next_hunk() <CR>", "Next Hunk" },
		v = { "<cmd> lua require 'gitsigns'.prev_hunk() <CR>", "Prev Hunk" },
		l = { "<cmd> lua require 'gitsigns'.blame_line() <CR>", "Blame" },
		p = { "<cmd> lua require 'gitsigns'.preview_hunk() <CR>", "Preview Hunk" },
		r = { "<cmd> lua require 'gitsigns'.reset_hunk() <CR>", "Reset Hunk" },
		R = { "<cmd> lua require 'gitsigns'.reset_buffer() <CR>", "Reset Buffer" },
		k = { "<cmd> lua require 'gitsigns'.stage_hunk() <CR>", "Stage Hunk" },
    d = {
			"<cmd> Gitsigns diffthis HEAD <CR>",
			"Diff",
		},
		u = {
			"<cmd> lua require 'gitsigns'.undo_stage_hunk() <CR>",
			"Undo Stage Hunk",
		},
	},

	-- Buffer management using Barbar plugin
	B = {
		name = "Buffer",
		f = { "<cmd> BufferFirst <CR>", "Move to First Buffer" },
		l = { "<cmd> BufferLast <CR>", "Move to Last Buffer" },
		p = { "<cmd> BufferPin <CR>", "Pin/Unpin Buffer" },
		t = { "<cmd> BufferRestore <CR>", "Restore Buffer" },
		s = { "<cmd> BufferMoveStart <CR>", "Move Buffer to Start" },
		i = { "<cmd> BufferPick <CR>", "Buffer Pick" },
		d = { "<cmd> BufferPickDelete <CR>", "Delete Picked Buffer" },
		c = { "<cmd> BufferCloseAllButCurrentOrPinned <CR>", "Delete Picked Buffer" },
		o = {
			name = "Order",
			n = { "<cmd> BufferOrderByBufferNumber <CR>", "Order by Buffer Number" },
			d = { "<cmd> BufferOrderByDirectory <CR>", "Order by Directory" },
			l = { "<cmd> BufferOrderByLanguage <CR>", "Order by Language" },
			w = { "<cmd> BufferOrderByWindowNumber <CR>", "Order by Window Number" },
		},
	},

	-- Update/Install plugins and languages extensions
	u = {
		name = "Update/Install",
		l = {
			name = "Lazy - Plugin Manager",
			s = { "<cmd> Lazy sync <CR>", "Sync" },
			k = { "<cmd> Lazy check <CR>", "Check" },
			h = { "<cmd> Lazy help <CR>", "Help" },
			c = { "<cmd> Lazy clean <CR>", "Clean" },
			e = { "<cmd> Lazy health <CR>", "Health" },
			l = { "<cmd> Lazy log <CR>", "Log" },
			u = { "<cmd> Lazy update <CR>", "Update" },
			r = { "<cmd> Lazy reload <CR>", "Reload" },
		},
	},

	-- Setup Related Keymappings
	z = {
		name = "Setup Keys",
		t = { "<cmd> Telescope colorscheme <CR>", "Colorschemes" },
		h = { "<cmd> checkhealth <CR>", "Checkhealth" },
	},
}

-- Configuring Which-Key
local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

-- Setting for all the keys
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

wk.setup(setup)
wk.register(mappings, opts)
