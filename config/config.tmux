#
# tmux.conf
#
# @author = himkt

# default config
set -g status-interval 2
set -g default-terminal "screen-256color"
set -g status-justify left

# enable mouse mode
set-option -g mouse on
setw -g mode-keys vi

if-shell '[ $(echo "$(tmux -V | cut -d" " -f2) >= 2.4" | bc) -eq 1 ]' \
    bind-key -T copy-mode-vi WheelUpPane send -X scroll-up

if-shell '[ $(echo "$(tmux -V | cut -d" " -f2) >= 2.4" | bc) -eq 1 ]' \
    bind-key -T copy-mode-vi WheelDownPane send -X scroll-down

# color
set -g status-fg colour231
set -g status-bg colour234

# window
set -g window-status-format "#[fg=colour244,bg=colour234]  #I #[fg=colour240] #[default]#W"
window_status_current_format1="#[fg=colour234,bg=colour31] #[fg=colour117,bg=colour31]"
window_status_current_format2="#I #[fg=colour231]#W #[fg=colour31,bg=colour234,nobold]"
window_status_current_format=$window_status_current_format1' '$window_status_current_format2
set -g window-status-current-format $window_status_current_format
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
status_left1="#{?client_prefix,#[fg=colour254]#[bg=colour31],#[fg=colour16]#[bg=colour254]}"
status_left2="#S #{?client_prefix,#[fg=colour31]#[bg=colour234]#[nobold],#[fg=colour254]#[bg=colour234]#[nobold]}"
set -qg status-left $status_left1' '$status_left2
set -qg status-right '%H:%M #[fg=colour16,bg=colour254]'

# tmux config
set -g escape-time 10

bind ^h select-layout even-horizontal
bind ^v select-layout even-vertical
