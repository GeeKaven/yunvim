vim.cmd([[packadd lsp_signature.nvim]])
vim.cmd([[packadd lspsaga.nvim]])
vim.cmd([[packadd cmp-nvim-lsp]])
vim.cmd([[packadd nvim-navic]])
vim.cmd([[packadd aerial.nvim]])
vim.cmd([[packadd vim-illuminate]])

local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local saga = require("lspsaga")

saga.init_lsp_saga({
   -- your configuration
})

local function custom_attach(client, bufnr)

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
end

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { "jsonls", "sumneko_lua", "tsserver" }

lsp_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = custom_attach,
    capabilities = capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
