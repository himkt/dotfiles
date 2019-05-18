

pyenv rehash && pip install neovim
nvim -u $(pwd)/nvim/config.d/tiny.init.vim +PlugInstall +qall
nvim -u $(pwd)/nvim/config.d/init.vim +UpdateRemotePlugins +qall
echo 'finish creating the neovim environment!'
