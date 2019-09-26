#! /bin/sh

mkdir -p $HOME/.config/nvim
ln -s $HOME/.dotfiles/nvim/config.d/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/nvim/config.d/coc-settings.json $HOME/.config/nvim/coc-settings.json

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -u $(pwd)/nvim/config.d/tiny.init.vim +PlugInstall +qall
echo 'finish creating the neovim environment!'
