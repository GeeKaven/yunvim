local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = YuVim.ui.float.border or "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = { "<leader>" }, -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local normal_mode_mappings = {
  -- ignore
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",

  ["="] = { '<cmd>vertical resize +2<CR>', 'resize +2' },
  ["-"] = { '<cmd>vertical resize -2<CR>', 'resize -2' },
  ["v"] = { '<C-W>v', 'split right' },
  ['V'] = { '<C-W>s', 'split below' },

  ["/"] = {
    name = "Yuvim",
    ["/"] = { '<cmd>Alpha<CR>', 'open dashboard' },
    c = { '<cmd>e $MYVIMRC<CR>', 'open config' },
  },

  p = {
    name = "Packer",
    i = { '<cmd>PackerInstall<CR>', 'install plugins' },
    s = { '<cmd>PackerSync<CR>', 'sync plugins' },
    u = { '<cmd>PackerUpdate<CR>', 'updae plugins'},
    c = { '<cmd>PackerClean<CR>', 'clean, plugins'}
  },

  a = {
    name = "Actions",
    n = { '<cmd>set nonumber!<CR>', 'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>', 'relative number' },
    t = { '<cmd>ToggleTerm direction=float<CR>', 'terminal float' },
  },

  b = {
    name = "Buffer",
    q = { '<cmd>Bdelete<CR>', 'Close current' },
    b = { '<cmd>BufferMovePrevious<CR>', 'Move back' },
    c = { '<cmd>BufferCloseAllButCurrent<CR>', 'Close but current' },
    d = { '<cmd>BufferOrderByDirectory<CR>', 'Order by directory' },
    f = { '<cmd>bfirst<CR>', 'First buffer' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>', 'Close Left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>', 'Close Right' },
    n = { '<cmd>BufferMoveNext<CR>', 'Move next' },
    p = { '<cmd>BufferPick<CR>', 'Pick Buffer' },
  },

  c = {
    name = "LSP",
    a = { 'code action' },
  },

  h = {
    name = "Hop",
    w = { '<cmd> HopWord <CR>', 'HopWord' },
    j = { '<cmd> HopLine <CR>', 'HopLine' },
    k = { '<cmd> HopLineStart <CR>', 'HopLineStart' },
    c = { '<cmd> HopChar1 <CR>', 'HopChar1' },
    cc = { '<cmd> HopChar2 <CR>', 'HopChar2' },
  },

  f = {
    name = "Telescope search",
    f = { '<cmd> Telescope find_files <CR>', 'find files' },
    w = { '<cmd> Telescope live_grep <CR>', 'find word' },
    b = { '<cmd> Telescope buffers <CR>', 'find buffers' },
    h = { '<cmd> Telescope help_tags <CR>', 'find help_tags' },
    g = { '<cmd> Telescope git_files <CR>', 'find git files' },
    c = { '<cmd>Telescope colorscheme<CR>', 'color schemes' },
    s = { '<cmd>Telescope search_history theme=dropdown<CR>', 'search history' }
  },

  g = {
    name = "Telescope git",
    c = { '<cmd> Telescope git_commits <CR>', 'find git commits' },
    s = { '<cmd> Telescope git_status <CR>', 'find git status' },
    d = {'<cmd> DiffviewOpen <CR>', 'diff open'},
    D = {'<cmd> DiffviewClose <CR>', 'diff close'},
    g = { 'lazygit' },
    h = {
      name = "Hunk",
      d = "diff hunk",
      p = "preview",
      R = "reset buffer",
      r = "reset hunk",
      s = "stage hunk",
      S = "stage buffer",
      t = "toggle deleted",
      u = "undo stage",
    },
    m = { 'blame line' },
  },
  x = {
    name = "Trouble",
    x = { '<cmd> TroubleToggle <CR>', 'TroubleToggle' },
    w = { '<cmd> TroubleToggle workspace_diagnostics <CR>', 'Trouble workspace_diagnostics' },
    d = { '<cmd> TroubleToggle document_diagnostics <CR>', 'Trouble document_diagnostics' },
    R = { '<cmd> TroubleToggle lsp_references<cr>', 'Trouble lsp_references' }
  }
}

local visual_mode_mappings = {
  c = {
    name = "LSP",
    a = { 'range code action' }
  },
  s = {
    name = "SnipRun",
    r = { '<cmd> SnipRun <CR>', 'SnipRun' },
    c = { '<cmd> SnipClose <CR>', 'SnipClose' }
  }
}

wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, opts)

local function attach_markdown()
  wk.register({
    a = {
      name = "Actions",
      m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    }
  }, opts)
end

local function attach_typescript()
  wk.register({
    c = {
      name = "LSP",
      F = { '<cmd>TypescriptFixAll<CR>',                   'fix all' },
      i = { '<cmd>TypescriptAddMissingImports<CR>',        'import all'},
      o = { '<cmd>TypescriptOrganizeImports<CR>',          'organize imports'},
      u = { '<cmd>TypescriptRemoveUnused<CR>',             'remove unused' },
    }
  }, opts)
end

local function attach_npm()
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', 'change version' },
      d = { '<cmd>lua require("package-info").delete()<CR>',         'delete package' },
      h = { "<cmd>lua require('package-info').hide()<CR>",           'hide'},
      i = { '<cmd>lua require("package-info").install()<CR>',        'install new package' },
      r = { '<cmd>lua require("package-info").reinstall()<CR>',      'reinstall dependencies' },
      s = { '<cmd>lua require("package-info").show()<CR>',           'show' },
      u = { '<cmd>lua require("package-info").update()<CR>',         'update package'},
    }
  }, opts)
end

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md",
  callback = function() attach_markdown() end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.ts", "*.tsx" },
  callback = function() attach_typescript() end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "package.json" },
  callback = function() attach_npm() end })
