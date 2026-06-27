local M = {}

-- Capabilities: merge blink.cmp LSP capabilities if available
local ok, blink = pcall(require, "blink.cmp")
M.capabilities = ok and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded" },
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- LspAttach: buffer-local keymaps applied whenever an LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end
		local bufnr = args.buf

		-- Disable LSP formatting — conform.nvim is the sole formatter
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "gt", vim.lsp.buf.type_definition, "Go to Type Definition")
		map("n", "K", vim.lsp.buf.hover, "Hover Docs")
		map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
	end,
})

return M
