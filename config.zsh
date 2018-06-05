#
# .zshrc - Zsh configuration
#


function load() {
  [ -f $1 ] && source $1
}

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

export EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$PATH:/usr/texbin
export PATH=$PATH:$HOME/.dotfiles/bin
export PYTHONDONTWRITEBYTECODE=1
export PYENV_ROOT=$HOME/.pyenv


# secret
load $HOME/.dotfiles/private/private.zsh


# autoloads
autoload -Uz colors; colors
autoload -Uz zmv
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -U compinit; compinit


# generals
case ${OSTYPE} in
  darwin*)
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/local/sbin:$PATH
    export PATH=$HOME/.local/bin:$PATH
    export MECAB_PATH=$(brew --prefix)/lib/libmecab.dylib
    ;;
  linux*)
    # for ipython
    export QT_QPA_PLATFORM='offscreen'

    export PATH=$PATH:/usr/local/sbin
    export PATH=$HOME/.local/bin:$PATH
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export PATH=$HOME/.linuxbrew/sbin:$PATH

    export PATH=/usr/local/cuda/bin:$PATH
    export CPATH=/usr/local/cuda/include:$CPATH
    export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
    ;;
esac


# etc
eval "$(rbenv init -)"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi


# brew home
export BREW_HOME=$(brew --prefix)


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
setopt prompt_subst


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
alias g++="g++ --std=c++11 -O3 -Wall -I$(brew --prefix)/include"

cd() {
  builtin cd $@ && ls;
}


# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%} ± "
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%} ● %{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ● %{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%} ● %{$reset_color%}"


# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}


# Show different symbols as appropriate for various Git repository states
function parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}


# If inside a Git repository, print its branch and state
function git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
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


# Set the right-hand prompt
# NOTE: do not use double quotation
PROMPT='%{${fg[yellow]}%}[ %~ ]%{${reset_color}%}'  # filepath
PROMPT+=' @ '
PROMPT+='%{${fg[cyan]}%}%m%{${reset_color}%}'  # hostname
PROMPT+=' '
PROMPT+=`echo -e "%{$fg_bold[blue]%}%D{%m/%f} -- %D{%K:%M:%S}%{${reset_color}%}"`  # timestamp
PROMPT+=$'\n'
PROMPT+='$ '
RPROMPT='$(git_prompt_string)'
SPROMPT="%{${fg[red]}%}%r is correct? [y, n, a, e]:%{${reset_color}%}"


load $HOME/.dotfiles/submodule/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh
load $HOME/.dotfiles/submodule/zsh-history-substring-search.git/zsh-history-substring-search.zsh
