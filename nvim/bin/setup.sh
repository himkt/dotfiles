#!/bin/bash

if type "pip3" > /dev/null 2>&1; then
  pip3 install neovim
fi

if type "nvim" > /dev/null 2>&1; then
  mkdir -p $HOME/.config/nvim
  mkdir -p $HOME/.config/coc

  ln -s $HOME/dotfiles/nvim/config.d/vimrc $HOME/.vimrc
  ln -s $HOME/dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim
  ln -s $HOME/dotfiles/nvim/snippet.d $HOME/.config/coc/ultisnips

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim -u $PWD/nvim/config.d/init.vim +PlugInstall +qall
  echo 'Plugin installed'

  if type "npm" > /dev/null 2>&1; then
    mkdir -p ~/.config/coc/extensions
    pushd $HOME/.config/coc/extensions
    cp $HOME/dotfiles/nvim/config.d/coc-package.json package.json
    npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
    popd

    nvim -u $PWD/nvim/config.d/init.vim +CocUpdateSync +qall
  fi

  echo 'Finish creating the neovim environment!'
fi
