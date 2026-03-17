local wezterm = require 'wezterm'
local config = wezterm.config_builder()

if wezterm.target_triple:find('windows') then
  config.default_prog = { "wsl.exe", "--cd", "~" }
end

config.keys = {
  { key = "F11", action = wezterm.action.ToggleFullScreen },
}

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12

config.color_scheme = 'Dracula (Official)'

return config
