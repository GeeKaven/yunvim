local vim = vim
local home = os.getenv('HOME')
local cache_dir = home .. '/.cache/nvim/'

local create_cache_dir = function()
  local data_dir = {
    cache_dir .. "backup",
    cache_dir .. "session",
    cache_dir .. "swap",
    cache_dir .. "tags",
    cache_dir .. "undo",
  }

  if vim.fn.isdirectory(cache_dir) == 0 then
    os.execute("mkdir -p " .. cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end

end

local load = function()
  local packer = require("core.packer")
  create_cache_dir()

  packer.ensure_plugins()
  require("core.options")
  packer.load_compile()
  require("core.keymap")

end

load()
