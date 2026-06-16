local mason_ok, mason = pcall(require, "mason")
if not mason_ok then return end

local lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_ok then return end

local tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
if not tool_installer_ok then return end

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed   = "✓",
      package_pending     = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = { "clangd", "pyright", "jdtls", "gopls", "ts_ls" },
  -- v2 API: automatic_enable = false means we call lspconfig.setup() ourselves per server
  automatic_enable = false,
})

mason_tool_installer.setup({
  ensure_installed = {
    "clang-format",       -- C/C++   (conform name: clang_format)
    "ruff",               -- Python  (conform name: ruff_format)
    "google-java-format", -- Java    (conform name: google_java_format)
    "goimports",          -- Go
    "prettier",           -- JS/TS/JSX/TSX
    "stylua",             -- Lua (formats this nvim config too)
  },
})
