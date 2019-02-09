#
# .zshrc - The zsh configuration
#


export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config

export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=$HOME/.local/bin:$PATH

export PATH=$PATH:/usr/texbin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# pyenv configs
export PYENV_ROOT=$HOME/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1


# generals
case ${OSTYPE} in
  darwin*)
    # for brew
    export PATH=/opt/brew/bin:$PATH
    export PATH=/opt/brew/opt/llvm/bin:$PATH
    export LDFLAGS="-L/opt/brew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/brew/opt/llvm/include"
    ;;

  linux*)
    # for ipython
    export QT_QPA_PLATFORM="offscreen"

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


# home dirs
if builtin command -v brew > /dev/null; then
  export BREW_HOME=$(brew --prefix)
fi

export ZPLUG_HOME=$HOME/.config/zplug


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
alias zmv="noglob zmv -W"


if [ -e $ZPLUG_HOME/init.zsh ]; then

  # zplug configurations
  source $ZPLUG_HOME/init.zsh
  zplug "himkt/zsh-git-prompt", use:"zsh-git-prompt.zsh"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-syntax-highlighting", defer:2
  zplug "rupa/z", use:z.sh
  zplug "peco/peco", as:command, from:gh-r
  zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
  zplug "motemen/ghq", as:command, from:gh-r, rename-to:ghq
  zplug "greymd/tmux-xpanes"

  # check whether if there are packages which it can install
  if ! zplug check --verbose; then
    zplug install
  fi

  zplug load
fi


# etc
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi

if which nvim > /dev/null; then
  alias vim=nvim
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
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"
zstyle ":completion:*:default" menu select=1


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
if which tmux > /dev/null; then
  alias tmux="tmux -u"
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


function peco-select-tmux-window()
{
  local window="$(tmux list-windows | peco | cut -d : -f 1)"
  if [ -n "$window" ]; then
    BUFFER="tmux select-window -t $window"
    zle accept-line
  fi
}


function tmux-command-prompt()
{
  BUFFER="tmux command-prompt"
  zle accept-line
}


function peco-kill-process () {
    ps -ef | peco | awk '{ print $2 }' | xargs kill
    zle clear-screen
}


# register custom functions
zle -N tmux-command-prompt
zle -N peco-change-dir
zle -N peco-history-selection
zle -N peco-kill-process
zle -N peco-select-tmux-window


# bindkeys
bindkey -e
bindkey '^U' tmux-command-prompt
bindkey "^R" peco-history-selection
bindkey "^K" peco-change-dir
bindkey '^Y' peco-select-tmux-window
bindkey '^J' peco-kill-process


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
