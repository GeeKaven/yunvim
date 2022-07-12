local plugins = {
  { "wbthomason/packer.nvim" },
  { 'folke/tokyonight.nvim',
    config = function()
      require("modules.configs.tokyonight")
    end 
  }
}

return plugins
