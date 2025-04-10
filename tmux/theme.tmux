# set -g @tmux_power_theme 'moon'
set -g @catppuccin_flavour 'mocha'
# set -g @catppuccin_flavour 'mocha'
set -g @catppuccin_status_default "on"
set -g @catppuccin_window_default_text "#W"
set -g @catppuccin_window_current_text "#W"


bind-key -r C-T run-shell "/Users/nicth99p/.local/scripts/theme-switcher.sh"
