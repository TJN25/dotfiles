-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Latte'

-- My additions
config.exit_behavior="Hold"
config.font = wezterm.font('MesloLGS NF')
config.font_size = 18
config.window_background_opacity = 0.95
config.enable_tab_bar = false


-- config.adjust_window_size_when_changing_font_size = false
-- config.debug_key_events = false
-- config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
