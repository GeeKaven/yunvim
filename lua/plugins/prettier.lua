local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "less",
    "scss",
    "typescript",
    "typescriptreact",
  },
})