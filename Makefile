# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

:PHONY: all docs brew cui cli gui fish nvim vscode tmux zsh poetry

all: clean cui gui docs
clean: fish_clean nvim_clean poetry_clean tmux_clean vscode_clean zsh_clean

cui: fish nvim poetry tmux zsh
gui: vscode


brew:
	$(PWD)/brew/bin/install-brew.sh

brew_cui:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_cli:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_gui:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui


fish:
	$(PWD)/fish/bin/setup.sh

nvim:
	$(PWD)/nvim/bin/setup.sh

poetry:
	$(PWD)/poetry/bin/setup.sh

tmux:
	$(PWD)/tmux/bin/setup.sh

vscode:
	$(PWD)/vscode/bin/setup.sh

zsh:
	$(PWD)/zsh/bin/setup.sh


fish_clean:
	rm -rf $(HOME)/.config/fish

nvim_clean:
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim
	rm -rf $(HOME)/.config/coc

poetry_clean:
	rm -rf $(HOME)/.config/pypoetry
	rm -rf "$(HOME)/Library/Application Support/pypoetry"

tmux_clean:
	rm -rf $(HOME)/.tmux.conf

vscode_clean:
	echo "not implemented"

zsh_clean:
	rm -rf $(HOME)/.zshrc
	rm -rf "$(HOME)/.config/zplug"


docs:
	@echo ""
	@echo "### Finish installing dotfiles!"
	@echo "Please run $(RED)source $$HOME/.zshrc$(NOCOLOR) on zsh to enable configures."
	@echo "- If you want to use nvim with extensions, please run $(RED)make nvim$(NOCOLOR) (which needs pyenv)."
	@echo "- If you want to install pyenv using brew, please read the Python section below."
	@echo ""
	@echo "---"
	@echo ""
	@echo "### Packages"
	@echo "- If you want to use linuxbrew/homebrew, please run $(RED)make brew_cui$(NOCOLOR)."
	@echo "- Please run $(RED)make brew$(NOCOLOR) before if you have not installed brew yet"
	@echo "- Additionally, $(RED)make brew_cli$(NOCOLOR) installs optional packages"
	@echo ""
	@echo "---"
	@echo ""
	@echo "### Python"
	@echo "- After $(RED)make brew, make brew_cui, source $$HOME/.zshrc$(NOCOLOR),"
	@echo "  you can run $(RED)make nvim$(NOCOLOR) to install Python and the nvim library"
	@echo ""
