#! /bin/sh

mkdir -p $HOME/.config/nvim
ln -s `pwd`/nvim/config.d/init.vim $HOME/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install neovim black isort autopep8 flake8 --user
nvim -u $(pwd)/nvim/config.d/tiny.init.vim +PlugInstall +qall
nvim -u $(pwd)/nvim/config.d/init.vim +UpdateRemotePlugins +qall
echo 'finish creating the neovim environment!'
