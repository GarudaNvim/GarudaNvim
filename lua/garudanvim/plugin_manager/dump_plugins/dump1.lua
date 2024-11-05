-- all the important plugins here
return {
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

  -- tree sitter for syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
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

  -- noice plugin for nice ui for messages, cmdline and popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
  },
  
  -- nvim-surround for changing delimiters pairs with ease
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
  }
}
