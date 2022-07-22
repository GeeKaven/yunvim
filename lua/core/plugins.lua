local plugins = {
  -- UI
  ["folke/tokyonight.nvim"] = {
    as = 'tokyonight',
    config = require("plugins.others").tokyonight,
  },
  ["kyazdani42/nvim-web-devicons"] = { opt = false },
  ["rcarriga/nvim-notify"] = {
    config = require("plugins.others").nvim_notify
  },
  ["nvim-lualine/lualine.nvim"] = {
    after = "nvim-navic",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.lualine")
    end
  },
  ["kyazdani42/nvim-tree.lua"] = {
    cmd = { "NvimTreeToggle" },
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("plugins.nvim-tree")
    end
  },
  ["SmiteshP/nvim-navic"] = {
    opt = true,
    requires = "neovim/nvim-lspconfig",
    after = "nvim-treesitter",
    config = require("plugins.others").nvim_navic
  },
  ["goolord/alpha-nvim"] = {
    opt = true,
    event = "BufWinEnter",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("plugins.alpha")
    end
  },
  ["akinsho/bufferline.nvim"] = {
    opt = true,
    tag = "v2.*",
    event = "BufReadPost",
    config = function()
      require("plugins.bufferline")
    end
  },
  ["dstein64/nvim-scrollview"] = {
    opt = true,
    event = "BufReadPost",
    config = require("plugins.others").nvim_scrollview
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    opt = true,
    event = "BufReadPost",
    config = require("plugins.others").indent_blankline
  },
  ["lewis6991/gitsigns.nvim"] = {
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("plugins.gitsigns")
    end,
    opt = true,
    requires = { "nvim-lua/plenary.nvim" }
  },


  -- Edit
  ["RRethy/vim-illuminate"] = {
    opt = true,
    event = "BufReadPost",
    config = require("plugins.others").illuminate
  },
  ["terrortylor/nvim-comment"] = {
    opt = false,
    config = require("plugins.others").nvim_comment
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    run = ':TSUpdate',
    event = 'BufReadPost',
    config = function()
      require("plugins.treesitter")
    end
  },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    opt = true
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    after = "nvim-treesitter",
    opt = true,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    opt = true
  },
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
    opt = true
  },
  ["andymass/vim-matchup"] = {
    opt = true,
    after = "nvim-treesitter",
    config = require("plugins.others").matchup
  },
  ["romainl/vim-cool"] = {
    opt = true,
    event = { "CursorMoved", "InsertEnter" }
  },
  ["phaazon/hop.nvim"] = {
    opt = true,
    branch = "v2",
    event = "BufReadPost",
    config = require("plugins.others").hop
  },
  ["karb94/neoscroll.nvim"] = {
    opt = true,
    event = "BufReadPost",
    config = require("plugins.others").neoscroll
  },
  ["norcalli/nvim-colorizer.lua"] = {
    opt = true,
    event = "BufReadPost",
    config = require("plugins.others").nvim_colorizer
  },
  ["moll/vim-bbye"] = {
    opt = true,
    cmd = { "Bdelete", "Bwipeout", "Bdelete!", "Bwipeout!" },
  },
  ["akinsho/toggleterm.nvim"] = {
    opt = true,
    tag = 'v2.*',
    event = "BufReadPost",
    config = function()
      require("plugins.toggleterm")
    end
  },
  ["rcarriga/nvim-dap-ui"] = {
    opt = false,
    config = require("plugins.dap").dapui,
    requires = {
      { "mfussenegger/nvim-dap", config = require("plugins.dap").dap },
      -- {
      --   "Pocco81/dap-buddy.nvim",
      --   opt = true,
      --   cmd = { "DIInstall", "DIUninstall", "DIList" },
      --   commit = "24923c3819a450a772bb8f675926d530e829665f",
      --   config = require("plugins.dap").dapinstall,
      -- },
    },
  },

  -- Cmp
  ["neovim/nvim-lspconfig"] = {
    opt = true,
    event = "BufReadPre",
    config = function()
      require("plugins.lsp")
    end,
  },
  ["williamboman/nvim-lsp-installer"] = {
    opt = false,
  },
  ["glepnir/lspsaga.nvim"] = {
    opt = true,
    branch = "main",
    after = "nvim-lspconfig"
  },
  ["stevearc/aerial.nvim"] = {
    opt = true,
    after = "nvim-lspconfig",
    config = require("plugins.others").aerial
  },
  ["ray-x/lsp_signature.nvim"] = {
    opt = true,
    after = "nvim-lspconfig"
  },
  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function()
      require("plugins.nvim-cmp")
    end,
    requires = {
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
      { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
      {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
          require("plugins.autopairs")
        end
      }
    }
  },
  ["L3MON4D3/LuaSnip"] = {
    config = function()
      require("plugins.luasnip")
    end,
    after = "nvim-cmp",
    requires = "rafamadriz/friendly-snippets"
  },

  -- Tool
  ["nvim-lua/plenary.nvim"] = { opt = false },

  ["nvim-telescope/telescope.nvim"] = {
    opt = true,
    config = function()
      require("plugins.telescope")
    end,
    requires = {
      { "nvim-lua/popup.nvim", opt = true },
      { "nvim-lua/plenary.nvim", opt = false }
    },
    cmd = "Telescope"
  },
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
    opt = true,
    after = "telescope.nvim"
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    opt = true,
    after = "telescope.nvim"
  },
  ["michaelb/sniprun"] = {
    opt = true,
    run = 'bash ./install.sh',
    cmd = { "SnipRun", "'<,'>SnipRun" },
  },
  ["nathom/filetype.nvim"] = {
    opt = false,
    config = require("plugins.others").filetype
  },
  ["folke/which-key.nvim"] = {
    opt = false,
    config = require("plugins.others").which_key
  },
  ["dstein64/vim-startuptime"] = {
    opt = true,
    cmd = "StartupTime"
  }

}

return plugins
