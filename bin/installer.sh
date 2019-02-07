#!/bin/sh


# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""


echo "clone .dotfiles..."
git clone https://github.com/himkt/dotfiles.git $HOME/.dotfiles


echo "installing..."
cd $HOME/.dotfiles && make


echo "installing minimal packages..."
cd $HOME/.dotfiles && make requirements


echo "finished."
