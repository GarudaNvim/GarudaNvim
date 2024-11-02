-- attempt to load the toggleterm plugin
local status_ok, options = pcall(require, "toggleterm")
if not status_ok then
	return
end

-- setup options for toggleterm
options.setup({
	size = 20,                    -- set the default terminal size
	open_mapping = [[<c-\>]],     -- key mapping to toggle the terminal
	hide_numbers = true,          -- hide line numbers in terminal buffers
	shade_filetypes = {},         -- no specific filetypes to shade
	shade_terminals = true,       -- enable shading for terminals
	shading_factor = 2,           -- set the shading intensity (1-3)
	start_in_insert = true,       -- open terminal in insert mode
	insert_mappings = true,       -- allow mappings in insert mode
	persist_size = true,          -- remember terminal window size
	direction = "float",          -- open terminal in a floating window
	close_on_exit = true,         -- close terminal on process exit
	shell = vim.o.shell,          -- use default shell for terminal

	float_opts = {
		border = "curved",        -- set border style for floating terminal
		winblend = 0,             -- set transparency level
		highlights = {            -- customize terminal border and background
			border = "Normal",
			background = "Normal",
		},
	},
})

-- function to set terminal-specific key mappings
function _G.set_terminal_keymaps()
	local opts = { noremap = true } -- keymap options for non-recursive mapping
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)    -- map escape to exit insert mode
	vim.api.nvim_buf_set_keymap(0, "t", "kj", [[<C-\><C-n>]], opts)       -- alternative exit insert mode
	vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd> ToggleTerm <CR>", opts) -- map 'q' to close terminal
end

-- apply terminal key mappings when opening a terminal
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- initialize terminal instances with specified commands
local Terminal = require("toggleterm.terminal").Terminal

-- lazyGit terminal instance and toggle function
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

-- node REPL terminal instance and toggle function
local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

-- htop terminal instance and toggle function
local htop = Terminal:new({ cmd = "htop", hidden = true })
function _HTOP_TOGGLE()
	htop:toggle()
end

-- python REPL terminal instance and toggle function
local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end
