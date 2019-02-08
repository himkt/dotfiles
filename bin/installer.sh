#!/bin/sh


# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""


echo "clone .dotfiles..."
git clone git@github.com:himkt/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles && git checkout build-automation


echo "installing..."
cd $HOME/.dotfiles && make


echo "finished."
