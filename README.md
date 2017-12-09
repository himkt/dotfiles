
.dotfiles : my configurations for command line tools

### Requirements

operating system: osx(>=10.9), centos(>=6.4), ubuntu(>=14.0)

editor: vim(>=7.3, +conceal, +luajit, +python) or neovim

### Installation

```
git clone git@github.com:himkt/.dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && make
```


### misc tools

misc contains some useful tools.


##### mklatex

NOTE: python3 is required.

mklatex is the template maker for latex/beamer.

If you want to make beamer template, please install [metropolis](https://github.com/matze/mtheme).
If you are using macOS, you can install it by TexShop.

```sh
mklatex -h                                                                                                                                                12/9/17|2:54:24  ± [ ● ][master]
usage: mklatex [-h] --name NAME [--beamer] [--double-column]

optional arguments:
  -h, --help            show this help message and exit
  --name NAME, -n NAME  name of the latex repository
  --beamer, -b
  --double-column, -d
```
