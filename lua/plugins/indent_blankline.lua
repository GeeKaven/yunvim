require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
}
vim.cmd("autocmd CursorMoved * IndentBlanklineRefresh")