-- NOTE: jdtls requires Java 17+ on PATH.
local handlers_ok, handlers = pcall(require, "garudanvim.plugin_config.lsp.handlers")
if not handlers_ok then return end

vim.lsp.config("jdtls", {
	capabilities = handlers.capabilities,
})

vim.lsp.enable("jdtls")
