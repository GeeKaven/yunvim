local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("not lualine")
  return
end

local navic = require("nvim-navic")

local mini_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = { "location" },
}
local simple_sections = {
  lualine_a = { "mode" },
  lualine_b = { "filetype" },
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = { "location" },
}
local aerial = {
  sections = mini_sections,
  filetypes = { "aerial" },
}

lualine.setup({
  options = {
    theme = 'tokyonight',
    disabled_filetypes = {},
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
      }
    },
    lualine_y = {
      { "filetype", colored = true, icon_only = true },
      { "encoding" },
      {
        "fileformat",
        icons_enabled = true,
        symbols = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        },
      },
    },
    lualine_z = { 'progress', 'location' }
  },
  extensions = {
    "nvim-tree",
    "toggleterm",
    aerial
  },
})
