#
# config.fish
#
# @author: himkt
#

bind \cs 'fzf-z-search'

# env
set -Ux EDITOR vim
set -Ux GOPATH $HOME/go
set -Ux LANG en_US.UTF-8
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux PYTHONDONTWRITEBYTECODE 1
set -Ux fish_color_search_match --background=$fish_color_selection

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_stagedstate " ● "
set -g __fish_git_prompt_char_dirtystate " ● "
set -g __fish_git_prompt_char_untrackedfiles " ● "
set -g __fish_git_prompt_char_conflictedstate " ✖ "
set -g __fish_git_prompt_char_cleanstate " ✔ "
set -g __fish_git_prompt_color_dirtystate $fish_color_param
set -g __fish_git_prompt_color_stagedstate $fish_color_host_remote
set -g __fish_git_prompt_color_invalidstate $fish_color_root
set -g __fish_git_prompt_color_untrackedfiles $fish_color_cwd_root
set -g __fish_git_prompt_color_cleanstate $fish_color_cwd

# brew
for brew_prefix in "/opt/brew" "$HOME/.linuxbrew" "/home/linuxbrew/.linuxbrew"
  set -ax PATH $brew_prefix/bin
  set -ax PATH $brew_prefix/sbin
end

set -Ux BREW_HOME (brew --prefix)

if type -q brew
  set -Ux PYTHONSYSTEMPATH $BREW_HOME/bin/python3
else
  set -Ux PYTHONSYSTEMPATH (which python3)
end

# other executable
for additional_executable_prefix in "$HOME/.local" "$HOME/dotfiles" "$HOME/.cargo" "$BREW_HOME/opt/llvm" "/usr/local/cuda"
  set -ax PATH $additional_executable_prefix/bin
end

# for GPU
if type -q nvidia-smi
  set -Uxa CPATH $HOME/.cudnn/active/cuda/include
  set -Uxa LD_LIBRARY_PATH $HOME/.cudnn/active/cuda/lib64
  set -Uxa LIBRARY_PATH $HOME/.cudnn/active/cuda/lib64
end

# Tmux
function attach_or_create_tmux_session
  if set -q TERM_PROGRAM; and test $TERM_PROGRAM = "vscode"
    return
  end

  if set -q TERMINAL_EMULATOR; and test $TERMINAL_EMULATOR = "JetBrains-JediTerm"
    return
  end

  if set -q DISABLE_TMUX
    return
  end

  if set -q TMUX_PANE
    return
  end

  if tmux has-session
    tmux attach
  else
    tmux
  end
end

if type -q tmux
  attach_or_create_tmux_session
end

# NeoVim
if type -q nvim
  set -Ux EDITOR nvim

  function vim
    nvim $argv
  end
end

# GHQ
if type -q ghq
  set -Ux GHQ_ROOT $HOME/work
end

# prompt
function fish_prompt
  printf '%s[ %s ]%s @ %s%s%s %s\n%s%s> ' \
    (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_host_remote) \
    (hostname| cut -d . -f1) (set_color $fish_color_host_remote) (set_color $fish_color_operator) (date '+%m/%d %H:%M:%S') (set_color normal)
end

function fish_right_prompt
  echo -n (fish_git_prompt)
end

# cd
function cd
  builtin cd $argv
  ls
end

# ssh
function ssh
  set ps_res (ps -p (ps -p %self -o ppid= | xargs) -o comm=)
  if [ "$ps_res" = "tmux" ]
    tmux rename-window (echo $argv[-1] | cut -d . -f 1)
    command ssh $argv
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh $argv
  end
end

# fzf z search
function fzf-z-search
  set res (z --list | sort -rn | cut -c 12- | fzf)
  if set -q res
    cd $res
    ls
  end
  commandline -f repaint
end
