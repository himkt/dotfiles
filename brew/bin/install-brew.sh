#!/bin/bash


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

test -d /usr/local && eval $(/usr/local/bin/brew shellenv)
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
test -r ~/.zprofile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.zprofile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
