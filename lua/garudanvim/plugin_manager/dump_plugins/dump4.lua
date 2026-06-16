-- LSP, completion, and formatting plugins
return {
  { "mason-org/mason.nvim",                      lazy = false },
  { "mason-org/mason-lspconfig.nvim",            lazy = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = false },
  { "neovim/nvim-lspconfig",                     lazy = false },
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
}
