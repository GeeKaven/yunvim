local fn = vim.fn
local data_dir = vim.fn.stdpath("data") .. "/site"
local packer_compiled = data_dir .. "/lua/packer_compiled.lua"

local packer_dir = data_dir .. "/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer_dir)) > 0 then
  print("Cloning packer ... ")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_dir,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  auto_clean = true,
  compile_on_sync = true,
  compile_path = packer_compiled,
  git = { clone_timeout = 6000 },
  display = {
    working_sym = "ﲊ",
    error_sym = "✗ ",
    done_sym = " ",
    removed_sym = " ",
    moved_sym = "",
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})

local plugins = require("modules")

return packer.startup(function(use)
  for _, p in pairs(plugins) do
    use(p)
  end

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)