local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<Leader>ff", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<Leader>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<Leader>fb", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<Leader>fh", "<cmd> Telescope help_tags <CR>", opts)
keymap("n", "<Leader>fo", "<cmd> Telescope oldfiles <CR>", opts)
keymap("n", "<Leader>fg", "<cmd> Telescope git_files <CR>", opts)
keymap("n", "<Leader>gc", "<cmd> Telescope git_commits <CR>", opts)
keymap("n", "<Leader>gs", "<cmd> Telescope git_status <CR>", opts)


-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("i", "<C-b>", "<ESC>^i", opts)      -- 論 beginning of line
keymap("i", "<C-e>", "<End>", opts)        -- 壟 end of line

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
