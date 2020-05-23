#! /bin/bash


if type "nvim" > /dev/null 2>&1; then
  rm -rf $HOME/.config/nvim $HOME/.vimrc
  mkdir -p $HOME/.config/nvim

  ln -s $HOME/.dotfiles/nvim/config.d/vimrc $HOME/.vimrc
  ln -s $HOME/.dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim -u $PWD/nvim/config.d/tiny.init.vim +PlugInstall +qall
  echo 'finish creating the neovim environment!'
fi
