
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
mklatex -n [project_name] -t [latex or l or beamer or b]
```

For more information, please run `mklatex --help`
