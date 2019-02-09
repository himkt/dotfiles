<div align="center"><img src='./assets/header.png' width=600></div>

# .dotfiles : My configurations for command line tools

<a href="https://circleci.com/gh/himkt/dotfiles"><img src="https://circleci.com/gh/himkt/dotfiles.svg?style=svg" alt="circleci"></a>
<a href="#"><img src="https://img.shields.io/github/stars/himkt/dotfiles.svg?maxAge=2592000&colorB=orange" alt="star"></a>
<a href="https://github.com/neovim/neovim"><img src="https://img.shields.io/badge/built%20with-neovim-blue.svg" alt="neovim"></a>
<a href="https://github.com/zsh-users/zsh"><img src="https://img.shields.io/badge/built%20with-zsh-red.svg" alt="zsh"></a>
<a href="https://github.com/tmux/tmux"><img src="https://img.shields.io/badge/built%20with-tmux-green.svg" alt="tmux"></a>
<a href="#"><img src="http://img.shields.io/badge/license-MIT-lightgray.svg?style=flat" alt="license"></a>

This repository provides configs for some softwares.


### Installation

```
zsh -c "$(curl -L https://raw.githubusercontent.com/himkt/dotfiles/master/bin/installer.sh)"
```


### Additional features

- `cd $HOME/.dotfiles && make requirements` does set-up NeoVim packages.
  - This command needs `pyenv`

- `cd $HOME/.dotfiles && make build_brew` installs `linuxbrew` or `homebrew`
  - If you want to use `brew` for package manager, please use.

- `cd $HOME/.dotfiles && make brew_bundle` installs some packages which I use.


### Requirements

- operating system
  + macOS >= 10.9
  + Ubuntu >=14.0

- software
  + curl
  + git
  + make
  + zsh
  + tmux (optional)
  + neovim (optional)
  + pyenv (optional)
