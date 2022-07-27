local vim = vim

require('core.config')
require('core.setting')

local packer = require('core.packer')
packer.bootstrapping()
require('core.keymap')
require('core.autocmds')

packer.load_compile()

vim.cmd('colorscheme tokyonight')
