
pyenv rehash && pip install neovim
nvim -u $(pwd)/config/config.tiny.nvim +PlugInstall +qall
nvim -u $(pwd)/config/config.nvim +UpdateRemotePlugins +qall
echo 'finish creating the neovim environment!'
