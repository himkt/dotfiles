## dotfiles

[![Actions Status](https://github.com/himkt/dotfiles/workflows/build/badge.svg)](https://github.com/himkt/dotfiles)

My configurations for zsh, tmux, neovim, vim and visual studio code.


## Installation

```
git clone git@github.com:himkt/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles && make
```

### Homebrew/Linuxbrew

If you don't have `brew`, you have to run `make build_brew` in advance.
`make brew_bundle` and `make brew_bundle_cli` builds some essential softwares for me.
`make brew_bundle_gui` is only available on macOS, which builds GUI applications.
