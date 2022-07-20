local api, cmd, fn = vim.api, vim.cmd, vim.fn
local data_dir = string.format("%s/site/", fn.stdpath("data"))
local packer_compiled = data_dir .. "lua/_compiled.lua"
local bak_compiled = data_dir .. "lua/bak_compiled.lua"

local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  self.repos = {}
  for repo, conf in pairs(require("core.plugins")) do
    self.repos[#self.repos+1] = vim.tbl_extend("force", { repo }, conf)
  end
end

function Packer:bootstrapping()
  local packer_path = data_dir .. "pack/packer/opt/packer.nvim"

  if fn.empty(fn.glob(packer_path)) > 0 then
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

    self:load_packer()
    packer.install()

  end
end

function Packer:load_packer()
  if not packer then
    api.nvim_command("packadd packer.nvim")
    packer = require("packer")
  end

  packer.init({
    display = {
      working_sym = "ﲊ",
      error_sym = "✗ ",
      done_sym = " ",
      removed_sym = " ",
      moved_sym = "",
      open_fn = function()
        return require("packer.util").float { border = "single" }
      end,
    },
    git = { clone_timeout = 1200 },
    compile_path = packer_compiled,
    auto_clean = true,
    compile_on_sync = true,
  })

  packer.reset()

  local use = packer.use
  self:load_plugins()
  use({ "wbthomason/packer.nvim", opt = true })
  for _, repo in ipairs(self.repos) do
		use(repo)
	end
end

local M = setmetatable({}, {
  __index = function(_, key)
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end,
})

function M.bootstrapping()
	Packer:bootstrapping()
end

function M.back_compile()
	if fn.filereadable(packer_compiled) == 1 then
		os.rename(packer_compiled, bak_compiled)
	end
	M.compile()
	vim.notify("Packer Compiled!", vim.log.levels.INFO)
end

function M.load_compile()
	if fn.filereadable(packer_compiled) == 1 then
		require("_compiled")
	else
		assert("Missing packer compile file Run PackerCompile Or PackerInstall to fix")
	end
	cmd([[command! PackerCompile lua require('core.pack').back_compile()]])
	cmd([[command! PackerInstall lua require('core.pack').install()]])
	cmd([[command! PackerUpdate lua require('core.pack').update()]])
	cmd([[command! PackerSync lua require('core.pack').sync()]])
	cmd([[command! PackerClean lua require('core.pack').clean()]])
	cmd([[autocmd User PackerComplete lua require('core.pack').back_compile()]])
	cmd([[command! PackerStatus lua require('core.pack').compile() require('packer').status()]])
end


return M
