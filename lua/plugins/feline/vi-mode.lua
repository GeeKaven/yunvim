local colors = require("tokyonight.colors").setup()
local api = vim.api

local mode_alias = {
  ['n'] = 'NORMAL',
  ['no'] = 'OP',
  ['nov'] = 'OP',
  ['noV'] = 'OP',
  ['no'] = 'OP',
  ['niI'] = 'NORMAL',
  ['niR'] = 'NORMAL',
  ['niV'] = 'NORMAL',
  ['v'] = 'VISUAL',
  ['V'] = 'V-LINES',
  [''] = 'V-BLOCK',
  ['s'] = 'SELECT',
  ['S'] = 'S-LINES',
  [''] = 'S-BLOCK',
  ['i'] = 'INSERT',
  ['ic'] = 'INSERT',
  ['ix'] = 'INSERT',
  ['R'] = 'REPLACE',
  ['Rc'] = 'REPLACE',
  ['Rv'] = 'V-REPLACE',
  ['Rx'] = 'REPLACE',
  ['c'] = 'COMMAND',
  ['cv'] = 'COMMAND',
  ['ce'] = 'COMMAND',
  ['r'] = 'ENTER',
  ['rm'] = 'MORE',
  ['r?'] = 'CONFIRM',
  ['!'] = 'SHELL',
  ['t'] = 'TERM',
  ['nt'] = 'NTERM',
  ['null'] = 'NONE',
}

local mode_color = {
  ['NORMAL'] = colors.blue,
  ['OP'] = colors.blue,
  ['INSERT'] = colors.purple,
  ['VISUAL'] = colors.cyan,
  ['V-LINES'] = colors.cyan,
  ['V-BLOCK'] = colors.cyan,
  ['REPLACE'] = colors.orange,
  ['V-REPLACE'] = colors.orange,
  ['SELECT'] = colors.blue1,
  ['S-LINES'] = colors.blue1,
  ['S-BLOCK'] = colors.blue1,
  ['ENTER'] = colors.teal,
  ['MORE'] = colors.teal,
  ['CONFIRM'] = colors.teal,
  ['COMMAND'] = colors.green,
  ['SHELL'] = colors.green,
  ['TERM'] = colors.green,
  ['NTERM'] = colors.yellow,
  ['NONE'] = colors.red,
}

local VI_MODE = {}

function VI_MODE.current_hl ()
	return {
    fg = colors.bg,
    bg = mode_color[VI_MODE.current_mode()],
    style= 'bold'
	}
end

function VI_MODE.current_mode ()
	return mode_alias[api.nvim_get_mode().mode]
end

VI_MODE.cmp = {
    left = {
      provider = function()
        return ' ' .. VI_MODE.current_mode() .. ' '
      end,
      hl = VI_MODE.current_hl,
      right_sep = ' ',
    },
    right = {
      provider = '▊',
      hl = VI_MODE.current_hl,
      left_sep = ' '
    }
}

return VI_MODE

