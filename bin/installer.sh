#!/bin/sh


# check git command
type git || {
  echo -e "Please install git or update your path to include the git executable!"
  exit 1
}


echo -e "Clone dotfiles..."
git clone git@github.com:himkt/dotfiles.git $HOME/.dotfiles


echo -e "Installing dotfiles..."
cd $HOME/.dotfiles && make


echo -e ""
echo -e "### Finish installing dotfiles!"
echo -e "Please run \e[31msource $HOME/.zshrc\e[0m on zsh to enable configures."
echo -e "- If you want to use neovim with extensions,"
echo -e "  please run \e[31mmake requirements\e[0m (which needs pyenv)."
echo -e " If you want to install pyenv using brew, please read the Python section below."
echo -e ""
echo -e "---"
echo -e ""
echo -e "### Packages"
echo -e "- If you want to use linuxbrew/homebrew,"
echo -e "  please run \e[31mmake brew_bundle\e[0m."
echo -e "  Please run \e[31mmake build_brew\e[0m before"
echo -e "  if you have not installed brew yet"
echo -e ""
echo -e "---"
echo -e "### Python"
echo -e "- After \e[31mmake build_brew, make brew_bundle, source $HOME/.zshrc\e[0m"
echo -e "  you can run \e[31mmake requirements\e[0m to install Python and the neovim library"
echo -e ""
