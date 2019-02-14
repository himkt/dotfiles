
echo 'install python'
CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install --skip-existing 3.6.3
pyenv global 3.6.3 && pyenv rehash && pip install neovim
nvim -u $(PWD)/config/confign.tiny.vim +PlugInstall +qall
nvim -u $(PWD)/config/confign.vim +UpdateRemotePlugins +qall
echo 'finish creating the neovim environment!'
echo 'pyenv global <your_using_python_version> to return your python'
