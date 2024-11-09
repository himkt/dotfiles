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
  if [ "$INSTALL_HOMEBREW_ON_HOME" != "" ]; then
    HOMEBREW_INSTALL_DIR=$HOME/.linuxbrew
    echo "Start custom installation to $HOMEBREW_INSTALL_DIR"
    mkdir -p $HOMEBREW_INSTALL_DIR
    pushd $HOMEBREW_INSTALL_DIR
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOMEBREW_INSTALL_DIR
    popd
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  ;;
esac

