-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Latte"
-- require('gradient')

-- require('rose-pine')
-- config.color_scheme = 'Catppuccin Latte'

-- My additions
config.exit_behavior = "Hold"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 24
config.window_background_opacity = 0.95
config.enable_tab_bar = false

-- config.adjust_window_size_when_changing_font_size = false
-- config.debug_key_events = false
-- config.native_macos_fullscreen_mode = false
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm

config.leader = { key = "a", mods = "ALT|CTRL", timeout_milliseconds = 1000 }

config.keys = {
    {
        key = "^",
        mods = "CTRL",
        action = wezterm.action.DisableDefaultAssignment,
    },
}

local mux = wezterm.mux
local act = wezterm.action

-- Always return "FLOATING_NOTES" as the window title, regardless of what Neovim sets
wezterm.on("format-window-title", function()
    return "FLOATING_NOTES"
end)

-- Force "Always On Top" and position on right side of screen on startup
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    local gui = window:gui_window()
    gui:perform_action(act.ToggleAlwaysOnTop, pane)

    -- Position on the right side of the active screen
    local screen = wezterm.gui.screens().active
    local dims = gui:get_dimensions()
    local x = screen.x + screen.width - dims.pixel_width - 80
    local y = screen.y + 60
    gui:set_position(x, y)
end)

config.default_cwd = "/Users/nicth99p/Documents/notes/"

config.default_prog = {
    "/opt/homebrew/bin/nvim",
}
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.initial_cols = 80
config.initial_rows = 32
config.exit_behavior = "Close"
config.enable_tab_bar = false

return config
