local yu_packer = require("core.pack")
local packer = yu_packer.packer
local use = packer.use

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return packer.startup(function()
  use({
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
  })

  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = require("plugins.others").tokyonight,
  })

  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.nvim-cmp")
    end,
    requires = {
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      -- { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
      { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
      {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
          require("plugins.autopairs")
        end
      }
    }
  })

  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.luasnip")
    end,
    after = "nvim-cmp",
    requires = "rafamadriz/friendly-snippets"
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope")
    end,
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    event = "BufWinEnter"
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    event = 'BufReadPost',
    config = function()
      require("plugins.treesitter")
    end,
    requires = {
      { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
      { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
      {
        "andymass/vim-matchup",
        after = "nvim-treesitter",
        config = require("plugins.others").matchup
      },
    }
  })

  use({
    "terrortylor/nvim-comment",
    config = require("plugins.others").nvim_comment
  })

  use({
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
      require("plugins.gitsigns")
    end,
    requires = { "nvim-lua/plenary.nvim" }
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require("plugins.nvim-tree")
    end
  })

  if yu_packer.first then
    packer.sync()
  end
end)
