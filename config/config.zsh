#
# .zshrc - Zsh configuration
#


export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config

export PATH=$PATH:/usr/texbin
export PATH=$PATH:$HOME/.dotfiles/bin

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export PATH=$HOME/.local/bin:$PATH

export PYTHONDONTWRITEBYTECODE=1
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"


# generals
case ${OSTYPE} in
  darwin*)
    # for brew
    export PATH=/opt/brew/bin:$PATH
    ;;

  linux*)
    # for ipython
    export QT_QPA_PLATFORM='offscreen'

    # for brew
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export PATH=$HOME/.linuxbrew/sbin:$PATH
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    export PATH=/home/linuxbrew/.linuxbrew/sbin:$PATH

    # for GPU
    export PATH=$PATH:/usr/local/cuda/bin
    export CPATH=$CPATH:/usr/local/include
    export CPATH=$CPATH:/usr/local/cuda/include
    export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
    ;;
esac


# brew home
export BREW_HOME=$(brew --prefix)


case ${OSTYPE} in
  darwin*)
    export MECAB_PATH=$BREW_HOME/lib/libmecab.dylib
    ;;

  linux*)
    if builtin command -v mecab-config > /dev/null; then
      export MECAB_PATH=`mecab-config --libs-only-L`/libmecab.so.2
    fi
    ;;
esac


# aliases
case ${OSTYPE} in
  darwin*)
    alias ls="ls -G -F"
    ;;
  linux*)
    alias ls="ls --color=auto"
    ;;
esac

alias l="ls"
alias la="ls -a"
alias lla="ls -la"
alias vim='nvim'
alias tmux='tmux -u'
alias zmv='noglob zmv -W'
alias bruby="bundle exec ruby"
alias g++="g++ --std=c++11 -O3 -Wall -I$BREW_HOME/include"


# define function for loading modules
function load() {
  [ -f $1 ] && source $1
}


load $HOME/.dotfiles/private/private.zsh
load $HOME/.dotfiles/submodule/zsh-git-prompt.git/zsh-git-prompt.zsh
load $HOME/.dotfiles/submodule/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh
load $HOME/.dotfiles/submodule/zsh-history-substring-search.git/zsh-history-substring-search.zsh
load $HOME/.dotfiles/submodule/z.git/z.sh


# etc
if builtin command -v rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if builtin command -v pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

if which ghq > /dev/null; then
  export GHQ_ROOT=$HOME/work
fi

# autoloads
autoload -Uz zmv
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -U compinit; compinit



# zstyles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1


# options
setopt auto_cd correct
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY
setopt extended_history share_history
setopt hist_ignore_all_dups HIST_IGNORE_SPACE
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
setopt print_eight_bit
setopt extended_glob
setopt globdots
setopt auto_list
setopt no_beep
setopt no_flow_control
setopt magic_equal_subst
setopt auto_menu
setopt extended_glob


# colorscheme
if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]; then
  export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]; then
  export TERM=rxvt-256color
fi


# check whether tmux exists
if builtin command -v tmux > /dev/null; then
  if [ -z $TMUX ]; then
    # check tmux sessions
    if $(tmux has-session); then
      tmux attach
    else
      tmux
    fi
  fi
fi


# peco
function peco-history-selection() {
    case ${OSTYPE} in
      darwin*)
        BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
        ;;
      linux*)
        BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
        ;;
    esac
    CURSOR=$#BUFFER
    zle reset-prompt
}


function peco-change-dir() {
    selected_dir=$(find . -type d | grep -v .git | peco --prompt "[Change dir]")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle redisplay
}


# register custom functions
zle -N peco-change-dir
zle -N peco-history-selection


# bindkeys
bindkey -e
bindkey '^R' peco-history-selection
bindkey '^K' peco-change-dir
bindkey "\e[Z" reverse-menu-complete


# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000


# general purpose functions
function cd() {
  builtin cd $@ && ls;
}


function ssh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
    tmux rename-window ${@: -1}
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh "$@"
  fi
}
