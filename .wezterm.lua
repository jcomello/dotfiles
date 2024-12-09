local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback {
  'Jetbrains Mono Nerd Font',
  'Fira Code'
}
config.font_size = 15

config.enable_tab_bar = false

return config
