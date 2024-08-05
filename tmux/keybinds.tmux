# Basic remaps
bind | split-window -hc "#{pane_current_path}"
bind - split-window -vc "#{pane_current_path}"
bind -r "<" swap-window -t -1
bind -r ">" swap-window -t +1
bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
setw -g mode-keys vi

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

# Some copy mode stuff
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

# Show/Hide statusbar
bind-key u set-option -g status
