local handlers_ok, handlers = pcall(require, "garudanvim.plugin_config.lsp.handlers")
if not handlers_ok then return end

vim.lsp.config("gopls", {
	capabilities = handlers.capabilities,
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt     = false, -- conform.nvim handles formatting via goimports
		},
	},
})

vim.lsp.enable("gopls")
