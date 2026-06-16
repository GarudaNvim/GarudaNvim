local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then return end

local handlers_ok, handlers = pcall(require, "garudanvim.plugin_config.lsp.handlers")
if not handlers_ok then return end

-- lspconfig defaults cover JS/TS/JSX/TSX filetypes automatically
lspconfig.ts_ls.setup({
  on_attach    = handlers.on_attach,
  capabilities = handlers.capabilities,
})
