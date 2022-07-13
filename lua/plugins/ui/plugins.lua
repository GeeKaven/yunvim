local load = require("core.packer").register_plugin
local conf = require("plugins.ui.config")

load({"folke/tokyonight.nvim", config = conf.tokyonight})