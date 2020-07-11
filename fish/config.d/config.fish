#
# config.fish
#
# @author: himkt
#


# env
set -Ux EDITOR emacs
set -Ux GOPATH $HOME/go
set -Ux LANG en_US.UTF-8
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux PYTHONDONTWRITEBYTECODE 1

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
for additional_executable_prefix in "$HOME/.local" "$HOME/.dotfiles" "$HOME/.cargo" "$BREW_HOME/opt/llvm" "/usr/local/cuda"
  set -ax PATH $additional_executable_prefix/bin
end

# for GPU
if type -q nvidia-smi
  set -Uxa CPATH $HOME/.cudnn/active/cuda/include
  set -Uxa LD_LIBRARY_PATH $HOME/.cudnn/active/cuda/lib64
  set -Uxa LIBRARY_PATH $HOME/.cudnn/active/cuda/lib64
end

# Tmux
if type -q tmux
  if set -q TERM_PROGRAM; and test $TERM_PROGRAM != "vscode"; and ! set -q DISABLE_TMUX; or set -q SSH_CLIENT
    if tmux has-session
      tmux attach
    else
      tmux
    end
  end
end

# NeoVim
if type -q nvim
  function vim
    nvim $argv
  end
end

# GHQ
if type -q ghq
  set -Ux GHQ_ROOT $HOME/work
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
    tmux rename-window (echo $argv | cut -d . -f 1)
    command ssh "$argv"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh "$argv"
  end
end
