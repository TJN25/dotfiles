vnc_launcher="~/.local/scripts/vnc-launcher"
bind-key -r C-v run-shell "tmux neww $vnc_launcher"

# unbind O
# bind-key O display-popup -E "tmux neww $tmux_sessionizer"
