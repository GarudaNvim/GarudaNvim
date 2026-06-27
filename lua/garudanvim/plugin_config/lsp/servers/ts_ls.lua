local handlers_ok, handlers = pcall(require, "garudanvim.plugin_config.lsp.handlers")
if not handlers_ok then return end

vim.lsp.config("ts_ls", {
	capabilities = handlers.capabilities,
})

vim.lsp.enable("ts_ls")
