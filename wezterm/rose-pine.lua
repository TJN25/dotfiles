local wezterm = require('wezterm')
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

return {
    colors = theme.colors(),
    window_background_opacity = 0.95
    -- window_frame = theme.window_frame(), -- needed only if using fancy tab bar
}
