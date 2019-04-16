
echo 'install python'
CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install --skip-existing 3.6.3

CURRENT_PYTHON_VERSION=`pyenv version| cut -f1 -d ' '`
NEOVIM_PYTHON_VERSION=3.6.3

echo current python: $CURRENT_PYTHON_VERSION
echo python version for neovim: $NEOVIM_PYTHON_VERSION

pyenv global $NEOVIM_PYTHON_VERSION && pyenv rehash && pip install neovim
nvim -u $(pwd)/config/config.tiny.nvim +PlugInstall +qall
nvim -u $(pwd)/config/config.nvim +UpdateRemotePlugins +qall
echo 'finish creating the neovim environment!'

pyenv global $CURRENT_PYTHON_VERSION
echo now, current python: `pyenv version`
