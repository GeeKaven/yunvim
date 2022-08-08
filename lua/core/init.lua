local colors = require("tokyonight.colors").setup()
local vim = vim

require('core.config')
require('core.setting')

local packer = require('core.packer')
packer.bootstrapping()
require('core.keymap')
require('core.autocmds')

packer.load_compile()

vim.cmd('colorscheme tokyonight')
vim.api.nvim_command("highlight NvimTreeFolderIcon guifg=" .. colors.blue5)
vim.api.nvim_command("highlight NvimTreeFolderName guifg=" .. colors.blue5)
vim.api.nvim_command("highlight NvimTreeOpenedFolderName guifg=" .. colors.blue5)