# Makefile for dotfile configs
ZPLUG_HOME := $(HOME)/.config/zplug
TERM       := screen-256color
UNAME_S    := $(shell uname -s)
BREW       := $(shell which brew 2> /dev/null)
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

ifeq ($(UNAME_S),Darwin)
	BREW_COMPILER := /usr/bin/ruby -e
	BREW_SOURCE := https://raw.githubusercontent.com/Homebrew/install/master/install
else
	BREW_COMPILER := sh -c
	BREW_SOURCE := https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
endif

ifeq ($(BREW),)
	BREW_COMMAND := yes ' '| $(BREW_COMPILER) "$$(curl -fsSL $(BREW_SOURCE))"
endif

.PHONY: all vim_setup neovim_setup vscode_setup zsh_setup done \
	build_brew brew_bundle_tiny brew_bundle_tiny

all: clean setup done
setup: alacritty_setup neovim_setup vim_setup tmux_setup zsh_setup

build_brew:
	$(BREW_COMMAND)
brew_bundle:
	brew install gcc python3 neovim tmux wget zsh
brew_bundle_opt:
	brew install coreutils htop tree the_silver_searcher bat ghq
brew_bundle_cask:
	brew cask install google-chrome mendeley mactex
	brew cask install google-backup-and-sync microsoft-office 1password iterm2 tableplus postman

clean:
	@echo 'remove symbolic links'
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.tmux.conf
	rm -rf $(HOME)/.latexmkrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/coc
	rm -rf $(HOME)/.config/zplug
	rm -rf $(HOME)/.config/alacritty
	@echo 'done'

alacritty_setup:
	$(PWD)/alacritty/bin/setup.sh

neovim_setup:
	$(PWD)/nvim/bin/setup.sh

vim_setup:
	$(PWD)/vim/bin/setup.sh

vscode_setup:
	$(PWD)/vscode/bin/setup.sh

tmux_setup:
	$(PWD)/tmux/bin/setup.sh

zsh_setup:
	$(PWD)/zsh/bin/setup.sh

done:
	@echo ""
	@echo "### Finish installing dotfiles!"
	@echo "Please run $(RED)source $$HOME/.zshrc$(NOCOLOR) on zsh to enable configures."
	@echo "- If you want to use neovim with extensions,"
	@echo "  please run $(RED)make neovim_setup$(NOCOLOR) (which needs pyenv)."
	@echo " If you want to install pyenv using brew, please read the Python section below."
	@echo ""
	@echo "---"
	@echo ""
	@echo "### Packages"
	@echo "- If you want to use linuxbrew/homebrew,"
	@echo "  please run $(RED)make brew_bundle$(NOCOLOR)."
	@echo "  Please run $(RED)make build_brew$(NOCOLOR) before"
	@echo "  if you have not installed brew yet"
	@echo "  $(RED)make brew_bundle_opt$(NOCOLOR) installs optional packages"
	@echo ""
	@echo "---"
	@echo "### Python"
	@echo "- After $(RED)make build_brew, make brew_bundle, source $$HOME/.zshrc$(NOCOLOR)"
	@echo "  you can run $(RED)make neovim_setup$(NOCOLOR) to install Python and the neovim library"
	@echo ""
