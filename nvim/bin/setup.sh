#! /bin/bash


if type "nvim" > /dev/null 2>&1; then

  rm   -rf $HOME/.config/nvim $HOME/.config/coc $HOME/.vimrc
  mkdir -p $HOME/.config/nvim $HOME/.config/coc

  ln -s $HOME/.dotfiles/nvim/config.d/vimrc $HOME/.vimrc
  ln -s $HOME/.dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim
  ln -s $HOME/.dotfiles/nvim/config.d/coc-settings.json $HOME/.config/nvim/coc-settings.json
  ln -s $HOME/.dotfiles/nvim/snippets.d $HOME/.config/coc/ultisnips

  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  nvim -u $PWD/nvim/config.d/tiny.init.vim +PlugInstall +qall
  echo 'finish creating the neovim environment!'

  if type "npm" > /dev/null 2>&1; then
    npm i -g neovim eslint
  else
    echo "npm is not installed."
  fi
fi
