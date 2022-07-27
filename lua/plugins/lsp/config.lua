-- Diagnostic config
vim.diagnostic.config({
  float = {
    source = "always",
    style = "minimal",
    border = YuVim.ui.float.border,
    header = { YuVim.icons.bug .. ' Diagnostics:', 'Normal' },
    prefix = "",
  },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  -- virtual_text = {
  --   spacing = 4,
  --   source = 'always',
  --   prefix = YuVim.icons.circle
  -- },
  virtual_text = false
})

-- UI

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
