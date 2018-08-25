# tmux.conf
# @author = himkt

## default config
set -g status-interval 2
set -g default-terminal "screen-256color"
set -g status-justify left

## for mac osx
if-shell 'test "$(uname -s)" = Darwin' 'set -g default-command "reattach-to-user-namespace -l $SHELL"'

## enable mouse mode
set-option -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"
setw -g mode-keys vi

# color
set -g status-fg colour231
set -g status-bg colour234

# window
set -g window-status-format "#[fg=colour244,bg=colour234]  #I #[fg=colour240] #[default]#W "
set -g window-status-current-format "#[fg=colour234,bg=colour31] #[fg=colour117,bg=colour31] #I  #[fg=colour231]#W #[fg=colour31,bg=colour234,nobold]"
setw -g window-status-fg colour249
set -qg window-status-last-fg colour31
setw -g window-status-activity-attr none
setw -g window-status-activity-fg yellow
setw -g window-status-bell-attr none
setw -g window-status-bell-fg red

# take over current directory path
bind-key    '"' split-window -c "#{pane_current_path}"
bind-key    %   split-window -h -c "#{pane_current_path}"
bind-key    c   new-window -c "#{pane_current_path}"

# status bar
set -g status-left-length 20
set -qg status-left '#{?client_prefix,#[fg=colour254]#[bg=colour31],#[fg=colour16]#[bg=colour254]} #S #{?client_prefix,#[fg=colour31]#[bg=colour234]#[nobold],#[fg=colour254]#[bg=colour234]#[nobold]}'
set -qg status-right '%H:%M #[fg=colour16,bg=colour254]'

# tmux config
set -g escape-time 10

bind ^h select-layout even-horizontal
bind ^v select-layout even-vertical
