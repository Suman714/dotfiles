-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_close_confirmation = 'NeverPrompt'
config.warn_about_missing_glyphs=false

-- This is where you actually apply your config choices
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16

-- For example, changing the color scheme:
config.color_scheme = 'GruvboxDarkHard'
config.enable_tab_bar = false
config.window_background_opacity = 0.85
-- and finally, return the configuration to wezterm
return config
