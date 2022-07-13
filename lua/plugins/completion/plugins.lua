local load = require("core.packer").register_plugin
local conf = require("plugins.completion.config")

load({
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = conf.cmp,
  requires = {
    { "hrsh7th/cmp-path", after = "nvim-cmp" },
    { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
    { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
    { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
  }
})

load({
  "L3MON4D3/LuaSnip",
  config = conf.lua_snip,
  after = "nvim-cmp",
  requires = "rafamadriz/friendly-snippets"
})
