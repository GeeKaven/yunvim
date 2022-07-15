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

local modules = {
  "core.options",
  "core.plugins",
  "core.keymap"
}

create_cache_dir()
for _, mod in ipairs(modules) do
  local ok, e = pcall(require, mod)
  if not ok then
    error(("Error loading %s ... \n\n %s"):format(mod, e))
  end
end
