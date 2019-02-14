
echo 'install python'
CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" \
  pyenv install --skip-existing 3.6.3
