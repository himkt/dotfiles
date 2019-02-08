#
# .bashrc - The bash configuration
#


export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

export EDITOR=nvim
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
export BREW_HOME=$(brew --prefix)
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
