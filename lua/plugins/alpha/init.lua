local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⡿⠟⠛⠛⠛⠛⢻⣿⣟⣛⣉⣉⣉⣉⠉⠉⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⠟⠋⠀⠁⠐⠂⢀⠖⠁⠀⠀⠀⠀⠀⠀⠈⠉⠲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣤⣤⣄⣀⣠⠾⢯⣤⣦⣤⣤⣤⣀⡀⠀⠀⠀⢰⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⣿⡟⠉⢾⣿⠟⢉⡉⠉⢹⣟⢿⣷⣦⢢⠘⣿⠃⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣿⡟⠀⠀⠸⠁⢰⣿⣷⣶⣤⣿⣷⠙⢿⡃⠀⠛⠀⠀⢻⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⡿⠀⠀⠀⠀⠀⠚⠻⠿⣿⣟⣻⡿⠀⠈⠁⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⡿⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⡇⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠟⣿⠇⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣭⣕⡀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⣀⠉⠻⢿⣦⡀⠹⠙⣿⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⢀⣾⣷⣄⠀⣦⡻⣷⡀⠀⠸⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣦⡀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣧⢿⣧⠄⠀⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣦⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣏⡿⠃⣼⡿⠤⣰⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠀⠀⠛⠃⣠⣿⣿⣿⣿⣿⣿⣿]],
  [[⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣧⡀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
  [[⣿⣷⣄⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
}

dashboard.section.buttons.val = {
  dashboard.button("SPC f n", " New File", "<cmd>enew<cr>"),
  dashboard.button("SPC f p", " Find Project", "<cmd>Telescope project<cr>"),
  dashboard.button("SPC f f", " Find File"),
  dashboard.button("SPC f o", " Recently Files"),
  dashboard.button("SPC f w", " Find Text")
}

local fortune = require("alpha.fortune")()
dashboard.section.footer.val = fortune


local head_butt_padding = 2
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
local foot_butt_padding = 1

dashboard.config = {
  layout = {
    { type = "padding", val = header_padding },
    dashboard.section.header,
    { type = "padding", val = head_butt_padding },
    dashboard.section.buttons,
    { type = "padding", val = foot_butt_padding },
    dashboard.section.footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(dashboard.config)
