#! /bin/bash

if type "pip3" > /dev/null 2>&1; then
  pip3 install neovim
fi

if type "nvim" > /dev/null 2>&1; then
  rm -rf $HOME/.config/nvim $HOME/.vimrc
  mkdir -p $HOME/.config/nvim

  ln -s $HOME/.dotfiles/nvim/config.d/vimrc $HOME/.vimrc
  ln -s $HOME/.dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim
  ln -s $HOME/.dotfiles/nvim/snippet.d $HOME/.config/coc/ultisnips

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim -u $PWD/nvim/config.d/init.vim +PlugInstall +qall
  nvim -u $PWD/nvim/config.d/init.vim +CocUpdateSync +qall
  echo 'finish creating the neovim environment!'
fi
