local colors = require("tokyonight.colors").setup()
local vi_mode_utils = require 'feline.providers.vi_mode'
local cursor = require 'feline.providers.cursor'

local vi_mode_colors = {
  NORMAL = colors.cyan,
  OP = colors.green,
  VISUAL = colors.magenta,
  SELECT = colors.orange,
  INSERT = colors.green,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  COMMAND = colors.yellow,
  ENTER = colors.cyan,
  BLOCK = colors.blue,
  MORE = colors.cyan,
  SHELL = colors.red,
  TERM = colors.purple,
  NONE = colors.teal
}
local lsp = {}

function lsp.clients_are_attached()
  return (next(vim.lsp.buf_get_clients(0)) ~= nil)
end

function lsp.clients_names()
  local clients = {}
  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    clients[#clients + 1] = client.name
  end
  return table.concat(clients, ' ')
end

local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == 'UNIX' then
    icon = ' '
  elseif os == 'MAC' then
    icon = ' '
  else
    icon = ' '
  end
  return icon .. os
end

local function vimode_hl()
  return {
    name = vi_mode_utils.get_mode_highlight_name(),
    fg = colors.bg,
    bg = vi_mode_utils.get_mode_color(),
  }
end

local comps = {
  vi_mode = {
    left = {
      provider = function()
        return ' ' .. vi_mode_utils.get_vim_mode() .. ' '
      end,
      hl = vimode_hl,
      right_sep = ' ',
    },
    right = {
      provider = '▊',
      hl = vimode_hl,
      left_sep = ' '
    }
  },
  navic = {
    provider = function() return " " .. require('nvim-navic').get_location() end,
    enabled = function() return require('nvim-navic').is_available() end,
    left_sep = ' ',
    hl = {
      bg = colors.bg,
      fg = colors.fg,
    },
  },
  file = {
    info = {
      provider = 'file_info',
      hl = {
        fg = colors.blue,
        style = 'bold'
      }
    },
    encoding = {
      provider = 'file_encoding',
      left_sep = ' ',
      hl = {
        fg = colors.magenta,
        style = 'bold'
      }
    },
    type = {
      provider = 'file_type'
    },
    os = {
      provider = file_osinfo,
      left_sep = ' ',
      hl = {
        fg = colors.magenta,
        style = 'bold'
      }
    },
  },
  line_percentage = {
    provider = 'line_percentage',
    left_sep = ' ',
    hl = {
      style = 'bold'
    }
  },
  position = {
    provider = function()
      return ' ' .. cursor.position({}, {}) .. ' '
    end,
    left_sep = ' ',
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = colors.bg,
        bg = vi_mode_utils.get_mode_color(),
        style = 'bold'
      }
    end
  },
  scroll_bar = {
    provider = 'scroll_bar',
    left_sep = ' ',
    hl = {
      fg = colors.blue,
      style = 'bold'
    }
  },
  diagnos = {
    err = {
      provider = function()
        local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        return (#errors > 0 and YuVim.icons.error .. #errors or "")
      end,
      left_sep = ' ',
      enabled = function() return lsp.clients_are_attached() end,
      hl = {
        fg = colors.magenta2,
        style = 'bold'
      }
    },
    warn = {
      provider = function()
        local warnings = vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.WARN
        })
        return (#warnings > 0 and YuVim.icons.warningCircle .. #warnings or "")
      end,
      left_sep = ' ',
      enabled = function() return lsp.clients_are_attached() end,
      hl = {
        fg = colors.orange,
        style = "bold",
      },

    },
    hint = {
      provider = function()
        local hints = vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.HINT
        })
        return (#hints > 0 and YuVim.icons.lightbulb .. #hints or "")
      end,
      left_sep = ' ',
      enabled = function() return lsp.clients_are_attached() end,
      hl = {
        fg = colors.green,
        style = "bold",
      },
    },
    info = {
      provider = function()
        local infos = vim.diagnostic.get(0, {
          severity = vim.diagnostic.severity.INFO
        })
        return (#infos > 0 and YuVim.icons.info .. #infos or "")
      end,
      left_sep = ' ',
      enabled = function() return lsp.clients_are_attached() end,
      hl = {
        fg = colors.blue0,
        style = "bold",
      },
    },
  },
  lsp = {
    name = {
      provider = function() return YuVim.icons.paragraph .. lsp.clients_names() .. " " end,
      enabled = function() return lsp.clients_are_attached() end,
      left_sep = ' ',
      hl = {
        fg = colors.green2,
        style = 'bold'
      }
    }
  },
  git = {
    branch = {
      provider = 'git_branch',
      icon = YuVim.icons.git,
      left_sep = ' ',
      right_sep = ' ',
      hl = {
        fg = colors.magenta,
        style = 'bold'
      },
    },
    add = {
      provider = 'git_diff_added',
      hl = {
        fg = colors.green
      }
    },
    change = {
      provider = 'git_diff_changed',
      hl = {
        fg = colors.orange
      }
    },
    remove = {
      provider = 'git_diff_removed',
      hl = {
        fg = colors.red
      }
    }
  }
}

local components = {
  active   = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.active[1], comps.navic)

table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.scroll_bar)
table.insert(components.active[2], comps.line_percentage)
table.insert(components.active[2], comps.position)

table.insert(components.inactive, {})
table.insert(components.active[1], { hl = { bg = colors.bg } })


local force_inactive = {
  filetypes = {},
  buftypes  = {},
  bufnames  = {}
}

require 'feline'.setup {
  components = components,
  force_inactive = force_inactive,
  vi_mode_colors = vi_mode_colors,
  theme = colors
}
