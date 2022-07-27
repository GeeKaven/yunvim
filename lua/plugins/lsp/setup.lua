vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd nvim-navic]])
vim.cmd([[packadd aerial.nvim]])
vim.cmd([[packadd vim-illuminate]])
vim.cmd([[packadd typescript.nvim]])

-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, 'typescript')
local lsp_installer_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not lsp_installer_ok then
  return
end

local saga = require("lspsaga")

saga.init_lsp_saga({
   -- your configuration
   border_style = YuVim.ui.float.border
})

lsp_installer.setup {
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = { "bashls", "cssls", "eslint", "graphql", "html", "jsonls", "sumneko_lua", "tailwindcss", "tsserver", "vetur", "vuels" },
  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed
  automatic_installation = true,

  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = YuVim.ui.float.border or "rounded",
  }
}
local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = YuVim.ui.float.border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = YuVim.ui.float.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = YuVim.lsp.virtual_text }),
}

local function on_attach(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  require("lsp_signature").on_attach({
    bind = true,
    use_lspsaga = false,
    floating_window = true,
    fix_pos = true,
    hint_enable = true,
    hi_parameter = "Search",
    handler_opts = { "double" },
  })
  require("aerial").on_attach(client, bufnr)
  require("illuminate").on_attach(client)
  require("nvim-navic").attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

-- Order matters

local tsserver = require('plugins.lsp.servers.tsserver')
-- It enables tsserver automatically so no need to call lspconfig.tsserver.setup
if typescript_ok then
  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    -- LSP Config options
    server = {
      capabilities = tsserver.capabilities,
      handlers = handlers,
      on_attach = tsserver.on_attach,
    }
  })
end
local tailwindcss = require('plugins.lsp.servers.tailwindcss')
lspconfig.tailwindcss.setup {
  capabilities = tsserver.capabilities,
  filetypes = tailwindcss.filetypes,
  handlers = handlers,
  init_options = tailwindcss.init_options,
  on_attach = tailwindcss.on_attach,
  settings = tailwindcss.settings,
}

local eslint = require('plugins.lsp.servers.eslint')
lspconfig.eslint.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = eslint.on_attach,
  settings = eslint.settings,
}

local jsonls = require('plugins.lsp.servers.jsonls')
lspconfig.jsonls.setup {
  capabilities = capabilities,
  handlers = handlers,
  on_attach = on_attach,
  settings = jsonls.settings,
}

local sumneko_lua = require('plugins.lsp.servers.sumneko_lua')
lspconfig.sumneko_lua.setup {
  handlers = handlers,
  on_attach = on_attach,
  settings = sumneko_lua.settings,
}

local vuels = require('plugins.lsp.servers.vuels')
lspconfig.vuels.setup {
  filetypes = vuels.filetypes,
  handlers = handlers,
  init_options = vuels.init_options,
  on_attach = on_attach,
}

for _, server in ipairs { "bashls", "cssls", "graphql", "html", "volar" } do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
  }
end
