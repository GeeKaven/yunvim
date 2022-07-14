local M = {}

M.tokyonight = function()
  vim.g.tokyonight_style = 'night'
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

return M
