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

M.hop = function ()
  require("hop").setup({
    keys = 'etovxqpdygfblzhckisuran'
  })
end

return M
