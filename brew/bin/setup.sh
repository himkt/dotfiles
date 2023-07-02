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
  if [ "$LINUXBREW_INSTALL_DIR" != "" ]; then
    echo "Start custom installation to $LINUXBREW_INSTALL_DIR"
    mkdir -p $LINUXBREW_INSTALL_DIR
    pushd $LINUXBREW_INSTALL_DIR
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $LINUXBREW_INSTALL_DIR
    popd
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
  ;;
esac

