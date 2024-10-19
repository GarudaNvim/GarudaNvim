-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Non-repetitive action of noremap and silent
local opts = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-q>", ":resize -1<CR>", opts)
map("n", "<C-w>", ":resize +1<CR>", opts)
map("n", "<C-a>", ":vertical resize -2<CR>", opts)
map("n", "<C-s>", ":vertical resize +2<CR>", opts)

-- Go to  beginning and end
map("n", "<C-e>", "$", opts) -- End of line
map("n", "<C-b>", "0", opts) -- Beginning of line

-- Navigate buffers
map("n", "<S-l>", ":BufferNext<CR>", opts)
map("n", "<S-h>", ":BufferPrevious<CR>", opts)

-- Move Buffers
map("n", "<S-i>", ":BufferMoveNext<CR>", opts)
map("n", "<S-u>", ":BufferMovePrevious<CR>", opts)

-- Move text up and down
map("n", "<S-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<S-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Quick Actions
map("n", "<Esc>", ":noh <CR>", opts) -- Esc to No Highlight
map("n", "q", ":noh <CR>", opts) -- Esc to No Highlight
map("n", "<C-c>", "<cmd> %y+ <CR><CR>", opts) -- Copy Whole File
map("n", "d", '"_d', opts) -- Delete Without Yanking

-- Insert --
-- Press kj fast to exit insert mode
map("i", "kj", "<ESC>", opts)

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", opts) -- Move left
map("i", "<C-l>", "<Right>", opts) -- Move right
map("i", "<C-j>", "<Down>", opts) -- Move down
map("i", "<C-k>", "<Up>", opts) -- Move up

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<S-j>", ":m .+1<CR>==", opts)
map("v", "<S-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Replacing
map("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
