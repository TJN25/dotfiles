set -g history-limit 10000
#set-option -g prefix `
set -g mouse on
set -g bell-action none
set -g visual-bell off
set -g monitor-bell off
set-option -s set-clipboard on
# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1
set -g default-terminal "tmux"
