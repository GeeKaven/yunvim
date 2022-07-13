local cmd, fn = vim.cmd, vim.fn

local state_ok, packer = pcall(require, "packer")

local PACKER_BOOTSTRAP = false

if not state_ok then
  local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  print("Cloning packer ..")
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  print("Installing packer close and reopen Neovim...")

  cmd("packadd packer.nvim")

  state_ok, packer = pcall(require, "packer")

  if state_ok then
    print('Packer cloned successfully.')
    PACKER_BOOTSTRAP = true
  else
    error("Couldn't clone packer !\n Path :" .. packer_path .. "\n" .. packer)
  end
end

packer.init({
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
  git = { clone_timeout = 1200 },
  compile_path = fn.stdpath("config") .. "/lua/compiled.lua",
  auto_clean = true,
  compile_on_sync = true,
})

return {
  packer = packer,
  first = PACKER_BOOTSTRAP
}
