local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Latte"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 24
config.window_background_opacity = 0.95
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.exit_behavior = "Close"

config.initial_cols = 60
config.initial_rows = 20

config.default_cwd = os.getenv("HOME")

config.default_prog = {
    "/bin/zsh",
    "-lc",
    "source ~/.zshrc; clear; exec zsh -i",
}

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

wezterm.on("format-window-title", function()
    return "POPUP_TERMINAL"
end)

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    local gui = window:gui_window()

    gui:perform_action(act.ToggleAlwaysOnTop, pane)

    local screen = wezterm.gui.screens().active
    local dims = gui:get_dimensions()

    local x = screen.x + screen.width - dims.pixel_width - 100
    local y = screen.y + 100

    gui:set_position(x, y)
end)

return config
