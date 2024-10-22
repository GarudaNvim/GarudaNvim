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
		lazy = false,
	},

  -- find projects across the machine
	{
		"ahmedkhalf/project.nvim",
		lazy = false,
	},

  -- which-key plugin
  {
    "folke/which-key.nvim",
    version = "v1.6.0",
		event = "VeryLazy",
  },

  -- gitsigns for git status
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
  },

  -- tabline at the top
	{
		"romgrk/barbar.nvim",
		lazy = false,
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

  -- toggleterm for different terminals
  {
    "akinsho/toggleterm.nvim",
    version = "*", 
		event = "VeryLazy",
  },

  -- lazygit plugin to access lazygit inside GarudaNvim
  {
    "kdheepak/lazygit.nvim",
		event = "VeryLazy",
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
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
  },
  {
		"catppuccin/nvim",
		name = "catppuccin",
    lazy = false,
    priority = 1000, -- Ensure it loads first
	},

  -- dependencies
  {
    "nvim-tree/nvim-web-devicons", -- nvim-tree, barbar, lualine, alpha
  },
  {
		"nvim-telescope/telescope-ui-select.nvim", -- telescope, sets vim.ui.select to telescope
		event = "VeryLazy",
	},
  {
    "nvim-telescope/telescope-live-grep-args.nvim", -- telescope
  },
  {
    "nvim-lua/plenary.nvim", -- telescope
  },
}

return dump_plugins
