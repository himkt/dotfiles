# Makefile for dotfile configs
ZPLUG_HOME := $(HOME)/.config/zplug
TERM       := screen-256color
UNAME_S    := $(shell uname -s)
BREW       := $(shell which brew 2> /dev/null)

ifeq ($(UNAME_S),Darwin)
	BREW_COMPILER := /usr/bin/ruby -e
	BREW_SOURCE := https://raw.githubusercontent.com/Homebrew/install/master/install
else
	BREW_COMPILER := sh -c
	BREW_SOURCE := https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
endif

ifeq ($(BREW),)
	BREW_COMMAND := yes ' '| $(BREW_COMPILER) "`curl -fsSL $(BREW_SOURCE)`"
endif

.PHONY: all config clean build_brew brew_bundle_tiny brew_bundle_tiny

all: clean config link

link:
	@echo 'mkdir for config.d'
	mkdir -p $(HOME)/.config/nvim
	@echo 'create symbolic links...'
	ln -s $(PWD)/config/config.vim $(HOME)/.vimrc
	ln -s $(PWD)/config/config.zsh $(HOME)/.zshrc
	ln -s $(PWD)/config/config.tmux $(HOME)/.tmux.conf
	ln -s $(PWD)/config/confign.vim $(HOME)/.config/nvim/init.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	git clone https://github.com/zplug/zplug $(ZPLUG_HOME)
	@echo 'done'

clean:
	@echo 'remove symbolic links'
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.latexmkrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/zplug
	@echo 'done'

# if you have installed linuxbrew or homebrew,
# you can use this target
requirements:
	pyenv install 3.6.5 && pyenv virtualenv 3.6.5 neovim
	pyenv global neovim && pyenv rehash && pip install neovim
	nvim -u $(PWD)/config/confign.tiny.vim +PlugInstall +qall
	nvim -u $(PWD)/config/confign.vim +UpdateRemotePlugins +qall

build_brew:
	$(BREW_COMMAND)

brew_bundle:
	brew bundle --file=package/Brewfile
