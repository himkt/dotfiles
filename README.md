
.dotfiles : my configurations for command line tools

### Requirements

operating system: osx(>=10.9), centos(>=6.4), ubuntu(>=14.0)

editor: vim(>=7.3, +conceal, +luajit, +python) or neovim

### Installation

```
git clone git@github.com:himkt/.dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && make
```

### Misc

.dotfiles/bin provides you some tweak features.

ap makes a template for competitive programming.

To use, run bellow command in your terminal.

```
$ chmod 755 ./ap
$ ./ap a.cpp # make a.cpp in current directory
```

lt makes a template for scientific report.

Running bellow command to use.

```
lt main # create a project named "main" in current directory.
```

This project contains Makefile, main.tex, so you can compile with make command to create a pdf file.
