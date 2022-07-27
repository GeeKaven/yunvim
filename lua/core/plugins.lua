local plugins = {
  { 'nvim-lua/plenary.nvim' },
  { 'lewis6991/impatient.nvim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'dstein64/vim-startuptime', opt = true, cmd = 'StartupTime' },
  -- Dashboard
  { 'goolord/alpha-nvim',
    opt = true, event = 'BufWinEnter',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.alpha')"
  },
  -- Theme
  { 'folke/tokyonight.nvim', as = 'tokyonight', config = require('plugins.theme').tokyonight },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    opt = true, run = ':TSUpdate', event = 'BufReadPost',
    config = "require('plugins.treesitter')",
  },
  { 'windwp/nvim-ts-autotag', opt = true, after = 'nvim-treesitter' },
  { 'JoosepAlviste/nvim-ts-context-commentstring', opt = true, after = 'nvim-treesitter' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', opt = true, after = 'nvim-treesitter' },
  { 'p00f/nvim-ts-rainbow', opt = true, after = 'nvim-treesitter' },
  { 'andymass/vim-matchup', opt = true, after = 'nvim-treesitter',
    setup = function() vim.cmd([[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]) end
  },

  -- Telescope
  { 'nvim-telescope/telescope.nvim',
    opt = true, cmd = "Telescope",
    config = "",
    requires = {
      { "nvim-lua/popup.nvim", opt = true },
      { "nvim-lua/plenary.nvim", opt = false }
    }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', run = "make", opt = true, after = "telescope.nvim" },
  { 'nvim-telescope/telescope-project.nvim', opt = true, after = "telescope.nvim" },

  -- LSP base
  { 'neovim/nvim-lspconfig', opt = true, event = 'BufReadPre',
    config = "require('plugins.lsp')"
  },
  { 'williamboman/nvim-lsp-installer', opt = false },
  -- LSP add-on
  { 'glepnir/lspsaga.nvim', opt = true, branch = "main", after = "nvim-lspconfig" },
  { 'stevearc/aerial.nvim', opt = true, after = "nvim-lspconfig",
    config = function()
      require('aerial').setup({})
    end },
  { 'ray-x/lsp_signature.nvim', opt = true, after = 'nvim-lspconfig' },
  { 'folke/lsp-trouble.nvim', opt = true, after = 'nvim-lspconfig', config = "require('plugins.trouble')" },
  { 'jose-elias-alvarez/typescript.nvim', opt = true, after = 'nvim-lspconfig' },
  { 'SmiteshP/nvim-navic', opt = true, after = 'nvim-lspconfig' },
  { 'RRethy/vim-illuminate', opt = true, event = "BufReadPost", config = "require('plugins.illuminate')" },

  -- Cmp
  { 'hrsh7th/nvim-cmp',
    opt = true, event = 'InsertEnter',
    config = "require('plugins.cmp')",
    requires = {
      { 'hrsh7th/cmp-nvim-lua', after = 'LuaSnip' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' },
      { 'hrsh7th/cmp-path', after = 'cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer', after = 'cmp-path' },
      { 'hrsh7th/cmp-cmdline', after = 'cmp-buffer' },
      { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' },
      { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc' },
      { 'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim',
        config = function()
          require('cmp-npm').setup({
            ignore = {},
            only_semantic_versions = true,
          })
        end },
      { 'saadparwaiz1/cmp_luasnip', opt = true, after = 'cmp-npm' },
      { 'onsails/lspkind.nvim', opt = true, after = 'cmp_luasnip' }
    }
  },

  -- Snippets & Language & Syntax
  { 'L3MON4D3/LuaSnip',
    after = "nvim-cmp", requires = "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip").config.set_config({
        history = true,
        update_events = "TextChanged,TextChangedI"
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { 'windwp/nvim-autopairs', after = 'nvim-cmp', config = "require('plugins.autopairs')" },
  { 'lukas-reineke/indent-blankline.nvim',
    opt = true, event = 'BufReadPost',
    config = "require('plugins.indent_blankline')"
  },
  { 'norcalli/nvim-colorizer.lua', opt = true, event = 'BufReadPost', config = "require('plugins.colorizer')" },

  -- General
  { 'rcarriga/nvim-notify', config = "require('plugins.notify')" },
  { 'nvim-lualine/lualine.nvim',
    after = 'nvim-navic', requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.lualine')"
  },
  { 'kyazdani42/nvim-tree.lua',
    opt = true, cmd = { 'NvimTreeToggle' },
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require('plugins.tree')"
  },
  { 'akinsho/bufferline.nvim',
    opt = true, tag = "v2.*", event = "BufReadPost",
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require('plugins.bufferline')"
  },
  { 'dstein64/nvim-scrollview', opt = true, event = 'BufReadPost' },
  { 'moll/vim-bbye', opt = true, cmd = { 'Bdelete', 'Bwipeout', 'Bdelete!', 'Bwipeout!' } },
  { 'romainl/vim-cool', opt = true, event = { "CursorMoved", "InsertEnter" } },
  { 'terrortylor/nvim-comment', opt = false, config = "require('plugins.comment')" },
  { 'karb94/neoscroll.nvim', opt = true, event = 'BufReadPost', config = "require('plugins.neoscroll')" },
  { 'folke/which-key.nvim', opt = true, keys = '<Leader>', config = "require('plugins.which_key')" },
  { 'nathom/filetype.nvim', opt = false },
  { 'akinsho/toggleterm.nvim',
    opt = true, tag = 'v2.*', event = "BufReadPost",
    config = "require('plugins.toggleterm')"
  },
  { 'phaazon/hop.nvim',
    opt = true, branch = "v2", event = "BufReadPost",
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'michaelb/sniprun', opt = true, run = 'bash ./install.sh', cmd = { "SnipRun", "'<,'>SnipRun" } }
}

return plugins
