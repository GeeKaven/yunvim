vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd nvim-navic]])
vim.cmd([[packadd aerial.nvim]])
vim.cmd([[packadd vim-illuminate]])
vim.cmd([[packadd typescript.nvim]])

-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, 'typescript')
local saga = require("lspsaga")

saga.init_lsp_saga({
  -- your configuration
  border_style = YuVim.ui.float.border
})
local lspconfig = require("lspconfig")

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = YuVim.ui.float.border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = YuVim.ui.float.border,
})

local function on_attach(client, bufnr)
  if client.name == "tsserver" then
    -- Modifying a server's capabilities is not recommended and is no longer
    -- necessary thanks to the `vim.lsp.buf.format` API introduced in Neovim
    -- 0.8. Users with Neovim 0.7 needs to uncomment below lines to make tsserver formatting work (or keep using eslint).

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  if client.name == "eslint" then
    client.server_capabilities.documentFormattingProvider = true
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end

  if client.name == "tailwindcss" then
    if client.server_capabilities.colorProvider then
      require "plugins/lsp/utils/documentcolors".buf_attach(bufnr)
    end
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

  if client.name ~= "cssls"
      and client.name ~= "tailwindcss"
      and client.name ~= "eslint"
      and client.name ~= "graphql" then
    require("nvim-navic").attach(client, bufnr)
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
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
      on_attach = on_attach,
    }
  })
end
local tailwindcss = require('plugins.lsp.servers.tailwindcss')
lspconfig.tailwindcss.setup {
  capabilities = tsserver.capabilities,
  filetypes = tailwindcss.filetypes,
  init_options = tailwindcss.init_options,
  on_attach = on_attach,
  settings = tailwindcss.settings,
}

local eslint = require('plugins.lsp.servers.eslint')
lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = eslint.settings,
}

local jsonls = require('plugins.lsp.servers.jsonls')
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = jsonls.settings,
}

local sumneko_lua = require('plugins.lsp.servers.sumneko_lua')
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = sumneko_lua.settings,
}

-- local vuels = require('plugins.lsp.servers.vuels')
-- lspconfig.vuels.setup {
--   filetypes = vuels.filetypes,
--   init_options = vuels.init_options,
--   on_attach = on_attach,
-- }

for _, server in ipairs { "bashls", "cssls", "html", "taplo", "rust_analyzer" } do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
