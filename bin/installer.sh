#!/bin/sh


# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}


echo "Clone dotfiles..."
git clone git@github.com:himkt/dotfiles.git $HOME/.dotfiles


echo "Installing dotfiles..."
cd $HOME/.dotfiles && make


source $HOME/.zshrc
echo "Finished!"
echo "- If you want to use neovim with extensions,"
echo "  please run `make requirements`."
echo "  (`make requirements` needs pyenv)"
echo "--------------------------------------------"
echo "- If you want to use linuxbrew/homebrew,"
echo "  please run `make brew_bundle`."
echo "  Please run `make build_brew` before"
echo "  if you have not installed brew yet"
