#! /bin/bash


echo 'Deploy settings'
LINK_FILE=settings.json

unlink ~/Library/Application\ Support/Code\ -\ Insiders/User/$LINK_FILE&>/dev/null
ln -sf $PWD/vscode/config.d/$LINK_FILE ~/Library/Application\ Support/Code\ -\ Insiders/User/$LINK_FILE


echo 'Install extensions'
EXTENSIONS=$(cat ./vscode/config.d/extensions.list)

for extension in ${EXTENSIONS[@]}; do \
  code-insiders --install-extension $extension; \
done
