local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
------------------ Normal ----------------------
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

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- save file
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":wq<CR>", opts)
keymap("n", "<A-S-q>", ":q!<CR>", opts)

-- no highlight
keymap("n", "<ESC>", "<cmd> noh <CR>", opts)

-- Navigate bufferline
keymap("n", "<S-q>", ":BufferClose<CR>", opts)
keymap("n", "<S-l>", "<cmd> BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd> BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-1>", "<cmd> BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", "<cmd> BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", "<cmd> BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", "<cmd> BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", "<cmd> BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", "<cmd> BufferLineGoToBuffer 6<CR>", opts)
 
-- Toggle Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Plugin Aerial
keymap("n", "<A-t>", ":AerialToggle! right<CR>", opts)

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", opts)
keymap("x", "ga", "<Plug>(EasyAlign)", opts)

-- LSP
keymap("n", "<Leader>li", "<cmd> LspInfo <CR>", opts)
keymap("n", "<Leader>lr", "<cmd> LspRestart <CR>", opts)
keymap("n", "<Leader>ca", "<cmd> Lspsaga code_action <CR>", opts)
keymap("v", "<Leader>ca", "<cmd> Lspsaga range_code_action <CR>", opts)

keymap("n", "<Leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", opts)
keymap("n", "gd", "<cmd> Lspsaga preview_definition <CR>", opts)
keymap("n", "gD", "<cmd> lua vim.lsp.buf.definition() <CR>", opts)
keymap("n", "gh", "<cmd> lua vim.lsp.buf.references() <CR>", opts)
keymap("n", "g[", "<cmd> Lspsaga diagnostic_jump_prev <CR>", opts)
keymap("n", "g]", "<cmd> Lspsaga diagnostic_jump_next <CR>", opts)
keymap("n", "gs", "<cmd> Lspsaga signature_help <CR>", opts)
keymap("n", "gr", "<cmd> Lspsaga rename <CR>", opts)
keymap("n", "K", "<cmd> Lspsaga hover_doc <CR>", opts)

-- keymap("n", '<C-f>', "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(-1) <CR>", opts)
-- keymap("n", '<C-d>', "<cmd> lua require('lspsaga.action').smart_scroll_with_saga(1) <CR>", opts)

------------------ Normal End ----------------------

-------------------- Insert --------------------
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("i", "<C-q>", "<ESC>:wq<CR>", opts)
keymap("i", "<C-b>", "<ESC>^i", opts) -- 論 beginning of line
keymap("i", "<C-e>", "<End>", opts) -- 壟 end of line
-------------------- Insert End --------------------


------------------ Visual ----------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

------------------ Visual End ----------------------

------------------ Visual Block ----------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
------------------ Visual Block End ----------------------
