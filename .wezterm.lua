local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback {
  'Jetbrains Mono Nerd Font',
  'Fira Code'
}
config.font_size = 15

config.color_scheme = 'Tokyo Night'
config.enable_tab_bar = false
config.window_decorations = "NONE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 0,
}
return config
