-- dumping all the plugins here
local dump_plugins = {
  -- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
	},

  -- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { 
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
	},

  -- find projects across the machine
	{
		"ahmedkhalf/project.nvim",
		lazy = false,
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

  -- dashboard/opening setup
	{
		"goolord/alpha-nvim",
		lazy = false,
	},

  -- colorscheme plugins
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },
  {
    "tiagovla/tokyodark.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },

  -- dependencies
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
		"nvim-telescope/telescope-ui-select.nvim", -- sets vim.ui.select to telescope
		event = "VeryLazy",
	},
  {
    "nvim-lua/plenary.nvim",
  },
}

return dump_plugins
