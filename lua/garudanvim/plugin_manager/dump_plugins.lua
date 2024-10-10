-- dumping all the plugins here
local dump_plugins = {
  -- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

  -- colorscheme plugins
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
}

return dump_plugins
