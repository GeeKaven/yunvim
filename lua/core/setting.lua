local cache_dir = os.getenv("HOME") .. "/.cache/nvim/"

local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = "menu,menuone,noselect",
  conceallevel = 0,
  concealcursor = "niv",
  fileformats = "mac,unix,dos",
  encoding = "utf-8",
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 2,
  sidescrolloff = 5,
  backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
  hidden = true,
  magic = true,
  virtualedit = "block",
  viewoptions = 'folds,cursor,curdir,slash,unix',
  sessionoptions = 'curdir,help,tabpages,winsize',
  wildignorecase = true,
  wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
  history = 500,
  smarttab = true,
  shiftround = true,
  timeout = true,
  ttimeout = true,
  timeoutlen = 500,
  ttimeoutlen = 10,
  infercase = true,
  complete = ".,w,b,k",
  grepformat = "%f:%l:%c:%m",
  switchbuf = "useopen",
  backspace = "indent,eol,start",
  diffopt = "filler,iwhite,internal,algorithm:patience",
  shortmess = "aoOTIcF",
  foldlevelstart = 99,
  ruler = false,
  list = true,
  winwidth = 30,
  winminwidth = 10,
  showcmd = false,
  equalalways = false,
  laststatus = 2,
  display = "lastline",
  listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
  formatoptions = "1jcroql",
  errorbells = false,
  textwidth = 80,
  autoindent = true,
  softtabstop = 1,
  breakindentopt = "shift:2,min:20",
  linebreak = true,
  guifont = "FiraCode Nerd Font Mono"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
vim.cmd "set whichwrap+=<,>,[,],h,l,~"

-- disable builtin vim plugins
local g = vim.g
local builtin_plugins = {
  'filetypes',
  'fzf',
  'gtags',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'matchit',
  'matchparen',
  'loginPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers'
}

for _, v in pairs(builtin_plugins) do
  g['loaded_' .. v] = 1
end

local globals = {
  fillchars                   = "fold:\\ ", --- Fill chars needed for folds
  mapleader                   = ' ',        --- Map leader key to SPC
  speeddating_no_mappings     = 1,          --- Disable default mappings for speeddating
}

for k, v in pairs(globals) do
  g[k] = v
end

vim.opt.shortmess:append('c');
vim.opt.formatoptions:remove('c');
vim.opt.formatoptions:remove('r');
vim.opt.formatoptions:remove('o');
