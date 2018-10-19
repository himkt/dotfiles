#
# config.fish - configuration for fish shell
#


if not functions -q fisher
    echo "Installing fisher for the first time..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fisher
end


function cd
  builtin cd $argv
  ls
end


switch (uname)
  case Linux
    alias ls "ls --color=auto"
  case Darwin
    alias ls "ls -G -F"
end


alias vim 'nvim'
# alias tmux 'tmux -u'
alias g++ 'g++ --std=c++11 -O3 -Wall -I(brew --prefix)/include'


set -x LANG ja_JP.UTF-8
set -x LC_CTYPE ja_JP.UTF-8
set -x EDITOR vim
set -x XDG_CONFIG_HOME $HOME/.config
set -x PYENV_ROOT $HOME/.pyenv

set -x PATH /usr/local/bin $PATH

switch (uname)
  case Linux
    set -x PATH /usr/local/sbin $PATH
    set -x PATH /usr/sbin $PATH

    set -x QT_QPA_PLATFORM 'offscreen'  # for IPython
    set -x PATH $HOME/.local/bin $PATH

    set -x PATH $HOME/.linuxbrew/bin $PATH
    set -x PATH $HOME/.linuxbrew/sbin $PATH

    # GPU configuration
    set -x PATH /usr/local/cuda/bin $PATH
    set -x CPATH /usr/local/include $CPATH
    set -x CPATH /usr/local/cuda/include $CPATH
    set -x LIBRARY_PATH /usr/local/cuda/lib64 $LIBRARY_PATH
    set -x LD_LIBRARY_PATH /usr/local/cuda/lib64 $LD_LIBRARY_PATH
    set -x MECAB_PATH (mecab-config --libs-only-L)/libmecab.so.2

  case Darwin
    set -x PATH /opt/brew/bin $PATH
end


if command -sq brew
  set -x BREW_HOME (brew --prefix)
end


set -x PATH $PYENV_ROOT/shims $PATH
set -g fish_user_paths $BREW_HOME/opt/gettext/bin $fish_user_paths


# FIXME automatically attach exist session
if command -sq tmux
  if [ -z $TMUX ]
  end
end


function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end


function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end
