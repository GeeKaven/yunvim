local theme = {}

theme.tokyonight = function()
  vim.g.tokyonight_style = 'storm'
  vim.g.tokyonight_sidebars = { 'qf' }
  vim.g.tokyonight_dark_sidebar = false
end

return theme
