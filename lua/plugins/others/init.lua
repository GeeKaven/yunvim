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

return M
