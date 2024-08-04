set -g mouse on
bind | split-window -hc "#{pane_current_path}"
# bind \ split-window -hc "#{pane_current_path}"
bind - split-window -vc "#{pane_current_path}"
bind -r "<" swap-window -t -1
bind -r ">" swap-window -t +1
setw -g mode-keys vi
set -g default-terminal "tmux"
# set -sg terminal-overrides ",*:RGB”
# set -ga terminal-overrides ",-256color:Tc"
bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
# map Vi movement keys as pane movement keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
# resize panes using PREFIX H, J, K, L
bind H resize-pane -L 10
bind J resize-pane -D 10
bind K resize-pane -U 10
bind L resize-pane -R 10

bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
