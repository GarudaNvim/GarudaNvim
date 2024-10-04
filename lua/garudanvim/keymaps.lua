-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- non-repetitive action of noremap and silent
local opts = { noremap = true, silent = true }

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

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
map("n", "<S-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<S-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Others
map("n", "<Esc>", ":noh <CR>", opts) -- Esc to No Highlight
map("n", "q", ":noh <CR>", opts) -- Esc to No Highlight
map("n", "<C-c>", "<cmd> %y+ <CR><CR>", opts) -- Copy Whole File
map("n", "d", '"_d', opts) -- Delete Without Yanking
map("n", "<Space>e", ":Lex <CR>", opts) -- Tree Explorer

-- Insert --
-- Press kj fast to exit insert mode
map("i", "kj", "<ESC>", opts)

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
