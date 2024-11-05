-- dependencies plugins
return {
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
  {
    "rcarriga/nvim-notify", -- noice
  },
  {
    "MunifTanjim/nui.nvim", -- noice
  },
}
