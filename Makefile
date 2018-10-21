# Makefile for dotfile configs
.PHONY: all config clean requirements reset


all: clean config

config:
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/fish
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | \
		ZPLUG_HOME=$(HOME)/.config/zplug zsh
	ln -s $(HOME)/.dotfiles/config/config.vim $(HOME)/.vimrc
	ln -s $(HOME)/.dotfiles/config/config.zsh $(HOME)/.zshrc
	ln -s $(HOME)/.dotfiles/config/config.tmux $(HOME)/.tmux.conf
	ln -s $(HOME)/.dotfiles/config/config.fish $(HOME)/.config/fish/config.fish
	ln -s $(HOME)/.dotfiles/config/confign.vim $(HOME)/.config/nvim/init.vim

clean:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.latexmkrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/fish
	rm -rf $(HOME)/.config/zplug

# if you have installed linuxbrew or homebrew,
# you can use this target
requirements:
	brew bundle --file=package/Brewfile
