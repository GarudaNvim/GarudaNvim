-- attempt to load the nvim-treesitter.configs plugin
local status_ok, options = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- setup treesitter options
options.setup({
	-- ensure_installed = "all", -- one of "all" or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing

	highlight = {
		enable = true,                           -- enable treesitter highlighting
		disable = { "" },                        -- list of languages for which to disable highlighting
		additional_vim_regex_highlighting = true -- allow vim regex highlighting alongside treesitter
	},

	autopairs = {
		enable = false,                          -- disable automatic pairing of brackets/quotes
	},

	indent = {
		enable = true,                           -- enable treesitter-based indentation
		disable = { "yaml" }                     -- disable indentation for specific languages
	},

	rainbow = {
		enable = true,                           -- enable rainbow highlighting for brackets
		disable = { "jsx", "html" },             -- list languages for which to disable rainbow highlighting
		query = "rainbow-parens",                -- query used to detect delimiter pairs
		-- highlight the entire buffer for rainbow effect
	},

	playground = {
		enable = true,                           -- enable treesitter playground for in-editor AST exploration
	},

	context_commentstring = {
		enable = true,                           -- enable context-aware comment strings
		enable_autocmd = false,                  -- disable auto-command for context-based comment strings
	},
})
