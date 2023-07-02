#!/bin/bash

case `uname -s` in
Darwin*)
  if [ `uname -m` = "arm64" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    sudo mkdir /opt/homebrew-x86_64
    sudo chown `whoami`:staff /opt/homebrew-x86_64
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/homebrew-x86_64
  fi
  ;;
Linux*)
  if [ "$LINUXBREW_INSTALL_PATH" != ""]; then
    echo "Start custom installation to $LINUXBREW_INSTALL_PATH"
    mkdir -p $LINUXBREW_INSTALL_PATH
    pushd $LINUXBREW_INSTALL_PATH
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $LINUXBREW_INSTALL_PATH
    popd
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  test -r /usr/local/bin/brew && eval $(/usr/local/bin/brew shellenv)
  test -r ~/.linuxbrew/bin/brew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  test -r ~/.zprofile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zprofile
  test -r ~/.profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
  ;;
esac

