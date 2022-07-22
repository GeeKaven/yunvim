local M = {}

M.tokyonight = function()
  vim.g.tokyonight_style = 'storm'
  vim.g.tokyonight_sidebars = { 'qf' }
  vim.cmd('colorscheme tokyonight')
end

M.nvim_comment = function()
  require("nvim_comment").setup({
    hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })
end

M.matchup = function()
  vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]])
end

M.nvim_colorizer = function()
  require("colorizer").setup()
end

M.nvim_notify = function()
  local notify = require("notify")
  notify.setup({
    background_colour = "Normal",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade",
    timeout = 2000
  })

  vim.notify = notify
end

M.indent_blankline = function()
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    space_char_blankline = " ",
  }
  vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")

end

M.nvim_scrollview = function()
  require('scrollview').setup()
end

M.aerial = function()
  require('aerial').setup({})
end

M.illuminate = function()
  vim.g.Illuminate_highlightUnderCursor = 0
  vim.g.Illuminate_ftblacklist = {
    "help",
    "dashboard",
    "alpha",
    "packer",
    "norg",
    "DoomInfo",
    "NvimTree",
    "Outline",
    "toggleterm",
  }
end

M.nvim_navic = function()
  require("nvim-navic").setup({})
end

M.filetype = function()
  require("filetype").setup({
    overrides = {
      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = "sh",
      },
    }
  })
end

M.hop = function()
  require("hop").setup({
    keys = 'etovxqpdygfblzhckisuran'
  })
end

M.neoscroll = function()
  require("neoscroll").setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
      '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil, -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  })
end

M.which_key = function ()
  require("which-key").setup({
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
      winblend = 0
    },
  })
end

return M
