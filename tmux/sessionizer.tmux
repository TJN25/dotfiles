tmux_sessionizer="~/.local/scripts/tmux-sessionizer"
# bind-key -r P run-shell "$tmux_sessionizer ~/bin/projects/"
# bind-key -r B run-shell "$tmux_sessionizer ~/bin"
# bind-key -r S run-shell "$tmux_sessionizer ~/sbgrid"
# bind-key -r H run-shell "$tmux_sessionizer config"
bind-key -r g run-shell "tmux neww $tmux_sessionizer"

# unbind O
# bind-key O display-popup -E "tmux neww $tmux_sessionizer"
