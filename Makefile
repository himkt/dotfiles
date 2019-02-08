# Makefile for dotfile configs
.PHONY: all config clean requirements build_essential build_zplug build_vimplug

all: clean config build_zplug build_vimplug

build_vimplug:
	echo 'install vim-plug'
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u $(HOME)/.dotfiles/config/confign.tiny.vim +PlugInstall +qall
	nvim -u $(HOME)/.dotfiles/config/confign.vim +UpdateRemotePlugins +qall

build_zplug:
	echo 'install zplug'
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | TERM=screen-256color zsh

link:
	echo 'mkdir for config.d'
	mkdir -p $(HOME)/.config/nvim
	echo 'create symbolic links...'
	ln -s $(HOME)/.dotfiles/config/config.vim $(HOME)/.vimrc
	ln -s $(HOME)/.dotfiles/config/config.zsh $(HOME)/.zshrc
	ln -s $(HOME)/.dotfiles/config/config.tmux $(HOME)/.tmux.conf
	ln -s $(HOME)/.dotfiles/config/confign.vim $(HOME)/.config/nvim/init.vim
	echo 'done'
	exec zsh

clean:
	rm -f $(HOME)/.vimrc
	rm -f $(HOME)/.zshrc
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.latexmkrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/zplug

build_essential:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# if you have installed linuxbrew or homebrew,
# you can use this target
requirements: build_essential
	brew bundle --file=package/Brewfile
