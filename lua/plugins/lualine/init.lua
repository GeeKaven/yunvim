local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("not lualine")
  return
end

lualine.setup({
  options = {
    theme = 'tokyonight',
    disabled_filetypes = {},
		component_separators = "|",
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
  },
})
