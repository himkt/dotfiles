#!/bin/bash

ln -s $HOME/dotfiles/nvim/config.d/vimrc $HOME/.vimrc

if type "nvim" > /dev/null 2>&1; then
  echo 'neovim found'
  mkdir -p $HOME/.config/nvim

  ln -s $HOME/dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim
  ln -s $HOME/dotfiles/nvim/config.d/coc-settings.json $HOME/.config/nvim/coc-settings.json

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim --headless -u $PWD/nvim/config.d/init.vim +PlugInstall +qall
  echo 'Plugin installed'
  nvim --headless -u $PWD/nvim/config.d/init.vim +CocUpdateSync +qall
  echo 'Update remote plugins'
  nvim --headless -u $PWD/nvim/config.d/init.vim +UpdateRemotePlugins +qall

  echo 'Finish creating the neovim environment!'
fi
