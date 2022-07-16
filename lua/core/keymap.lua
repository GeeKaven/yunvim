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

-- Navigate bufferline
keymap("n", "<Leader>bq", "<cmd> :Bdelete <CR>", opts)
keymap("n", "gb", "<cmd> BufferLinePick <CR>", opts)
keymap("n", "<S-l>", "<cmd> BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd> BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-S-l>", "<cmd> BufferLineMoveNext<CR>", opts)
keymap("n", "<A-S-h>", "<cmd> BufferLineMovePrev<CR>", opts)
keymap("n", "<Leader>be", "<cmd> BufferLineSortByExtension<CR>", opts)
keymap("n", "<Leader>bd", "<cmd> BufferLineSortByDirectory<CR>", opts)
keymap("n", "<A-1>", "<cmd> BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", "<cmd> BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", "<cmd> BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", "<cmd> BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", "<cmd> BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", "<cmd> BufferLineGoToBuffer 6<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- save file
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":wq<CR>", opts)
keymap("n", "<A-S-q>", ":q!<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- no highlight
keymap("n", "<ESC>", "<cmd> noh <CR>", opts)

-- Telescope
keymap("n", "<Leader>ff", "<cmd> Telescope find_files <CR>", opts)
keymap("n", "<Leader>fw", "<cmd> Telescope live_grep <CR>", opts)
keymap("n", "<Leader>fb", "<cmd> Telescope buffers <CR>", opts)
keymap("n", "<Leader>fh", "<cmd> Telescope help_tags <CR>", opts)
keymap("n", "<Leader>fo", "<cmd> Telescope oldfiles <CR>", opts)
keymap("n", "<Leader>fg", "<cmd> Telescope git_files <CR>", opts)
keymap("n", "<Leader>fz", "<cmd> Telescope zoxide list <CR>", opts)
keymap("n", "<Leader>gc", "<cmd> Telescope git_commits <CR>", opts)
keymap("n", "<Leader>gs", "<cmd> Telescope git_status <CR>", opts)

-- Packer
keymap("n", "<Leader>ps", "<cmd> PackerSync <CR>", opts)
keymap("n", "<Leader>pu", "<cmd> PackerUpdate <CR>", opts)
keymap("n", "<Leader>pi", "<cmd> PackerInstall <CR>", opts)
keymap("n", "<Leader>pc", "<cmd> PackerClean <CR>", opts)

-- LSP
keymap("n", "<Leader>ca", "<cmd> Lspsaga code_action <CR>", opts)
keymap("v", "<Leader>ca", "<cmd> Lspsaga range_code_action <CR>", opts)
keymap("n", "gd", "<cmd> Lspsaga preview_definition <CR>", opts)
keymap("n", "gD", "<cmd> lua vim.lsp.buf.definition() <CR>", opts)
keymap("n", "gh", "<cmd> lua vim.lsp.buf.references() <CR>", opts)
keymap("n", "g[", "<cmd> Lspsaga diagnostic_jump_prev <CR>", opts)
keymap("n", "g]", "<cmd> Lspsaga diagnostic_jump_next <CR>", opts)
keymap("n", "gs", "<cmd> Lspsaga signature_help <CR>", opts)
keymap("n", "gr", "<cmd> Lspsaga rename <CR>", opts)
keymap("n", "K", "<cmd> Lspsaga hover_doc <CR>", opts)
keymap("n", "<C-Up>", "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(-1) <CR>", opts)
keymap("n", "<C-Down>", "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(1) <CR>", opts)


-- Insert --
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("i", "<C-q>", "<ESC>:wq<CR>", opts)
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

-- SnapRun
keymap("v", "<Leader>r", "<cmd> SnipRun <CR>", opts)
keymap("v", "<Leader>c", "<cmd> SnipClose <CR>", opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
