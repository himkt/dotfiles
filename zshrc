#
# .zshrc - Zsh configuration
#
# @author = himkt
# @create = 2015/09/08
#


# editor and charset
export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export XDG_CONFIG_HOME=$HOME/.config
export PYENV_ROOT=$HOME/.pyenv


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
    export PATH=/opt/homebrew/bin:$PATH
    export MECAB_PATH=$(brew --prefix)/lib/libmecab.dylib
    ;;
  linux*)
    export PATH=$PATH:/usr/local/sbin
    export PATH=$HOME/.local/bin:$PATH
    export PATH=$HOME/.linuxbrew/bin:$PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib
    export PATH=$HOME/.clang/bin:$PATH
    ;;
esac

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


# etc
eval "$(rbenv init -)"
eval "$(pyenv init -)"
export PATH=$PATH:/usr/texbin
export PYTHONDONTWRITEBYTECODE=1
export PATH=$PATH:$HOME/.dotfiles/misc


# bindkeys
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward


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
alias zmv='noglob zmv -W'
alias bruby="bundle exec ruby"
alias g++="g++ --std=c++11 -I$(brew --prefix)/include"

function cd() {
  builtin cd $@ && ls;
}


PROMPT=`echo -e "%{${fg[magenta]}%}[ %~ ]%{${reset_color}%}
%{${fg[yellow]}%}%n@%{${fg[cyan]}%}%m%{${reset_color}%}\
%(?,%{${fg[blue]}%},%{${fg[red]}%}) $ %{${reset_color}%}"`

SPROMPT="%{${fg[red]}%}%r is correct? [y, n, a, e]:%{${reset_color}%}"


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
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

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

# Set the right-hand prompt
RPROMPT='$(git_prompt_string)'

source $HOME/.dotfiles/submodule/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/submodule/zsh-history-substring-search.git/zsh-history-substring-search.zsh
