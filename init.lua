local ok, _ = pcall(require, "compiled")
if not ok then
  vim.notify('Run :PackerCompile!', vim.log.levels.WARN, {
    title = 'YuNvim',
  })
end

require("core")
