-- dumping all the plugins here
local dump_plugins = {
  -- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
	},

  -- colorscheme plugins
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  -- tabline at the top
	{
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

  -- status line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
	},

  -- dependencies
  {
    "nvim-tree/nvim-web-devicons",
  },
}

return dump_plugins
