local yu_packer = require("core.packer")
local packer = yu_packer.packer
local use = packer.use

return packer.startup(function ()
  use({
    'wbthomason/packer.nvim',
  })

  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.g.tokyonight_style = 'night'
      vim.g.tokyonight_sidebars = { 'qf' }
      vim.cmd('colorscheme tokyonight')
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function ()
      require("plugins.nvim-cmp")
    end,
    requires = {
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      -- { "hrsh7thcmp-nvim-lsp", after = "nvim-lspconfig" },
      { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
    }
  })

  use({
    "L3MON4D3/LuaSnip",
    config = function ()
      require("plugins.luasnip")
    end,
    after = "nvim-cmp",
    requires = "rafamadriz/friendly-snippets"
  })

  if yu_packer.first then
    packer.sync()
  end
end)