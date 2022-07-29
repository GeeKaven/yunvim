local mason_ok, mason = pcall(require, 'mason')

if not mason_ok then
  return
end

mason.setup {
  -- { "bashls", "cssls", "eslint", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver" },

  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = YuVim.ui.float.border or "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}