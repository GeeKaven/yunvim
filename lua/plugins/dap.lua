local colors = require("tokyonight.colors").setup()

local dapui = require("dapui")
local dap = require("dap")

local cmd, fn, api = vim.cmd, vim.fn, vim.api

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = YuVim.ui.float.border or 'rounded', -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

cmd("highlight DapBreakpoint" .. " guifg=" .. colors.red .. " guibg=" .. colors.bg)
cmd("highlight DapStopped" .. " guifg=" .. colors.yellow .. " guibg=" .. colors.bg)
fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = '' })

dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open();
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close();
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close();
end

-- Keybindings
api.nvim_set_keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>",
  { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>",
  { noremap = true, silent = true })
api.nvim_set_keymap("n", "<F10>", "<CMD>lua require('dap').step_over()<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<F11>", "<CMD>lua require('dap').step_into()<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<F12>", "<CMD>lua require('dap').step_out()<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", { noremap = true, silent = true })

-- NODE / TYPESCRIPT
dap.adapters.node2 = {
  type = 'executable';
  command = 'node',
  args = { fn.stdpath "data" .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
}

-- Chrome
dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { fn.stdpath "data" .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' };
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  }
}

local chromConfig = {
  type = "chrome",
  request = "attach",
  program = "${file}",
  cwd = fn.getcwd(),
  sourceMaps = true,
  protocol = "inspector",
  port = 9222,
  webRoot = "${workspaceFolder}"
}

dap.configurations.javascript = { chromConfig }
dap.configurations.javascriptreact = { chromConfig }
dap.configurations.typescriptreact = { chromConfig }
