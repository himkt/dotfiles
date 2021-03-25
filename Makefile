# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: all docs brew cui cli gui emacs fish nvim vscode tmux zsh poetry

all: clean cui docs
clean: fish_clean nvim_clean poetry_clean tmux_clean vscode_clean zsh_clean

cui: fish nvim poetry tmux zsh
gui: vscode


brew:
	$(PWD)/brew/bin/setup.sh

brew_cui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_cli:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_gui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui


emacs: emacs_clean
	$(PWD)/emacs/bin/setup.sh

fish: fish_clean
	$(PWD)/fish/bin/setup.sh

git: git_clean
	$(PWD)/git/bin/setup.sh

hyper: hyper_clean
	$(PWD)/hyper/bin/setup.sh

nvim: nvim_clean
	$(PWD)/nvim/bin/setup.sh

poetry: poetry_clean
	$(PWD)/poetry/bin/setup.sh

tmux: tmux_clean
	$(PWD)/tmux/bin/setup.sh

vscode: vscode_clean
	$(PWD)/vscode/bin/setup.sh

zsh: zsh_clean
	$(PWD)/zsh/bin/setup.sh

emacs_clean:
	rm -rf $(HOME)/.emacs.d

fish_clean:
	rm -rf $(HOME)/.config/fish

git_clean:
	rm -rf $(HOME)/.config/git

hyper_clean:
	rm -rf $(HOME)/.hyper.js

nvim_clean:
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

poetry_clean:
	rm -rf $(HOME)/.config/pypoetry
	rm -rf "$(HOME)/Library/Application Support/pypoetry"

tmux_clean:
	rm -rf $(HOME)/.tmux.conf

vscode_clean:
	rm -rf $(HOME)/Library/Application\ Support/Code/User/keybindings.json
	rm -rf $(HOME)/Library/Application\ Support/Code/User/settings.json
	rm -rf $(HOME)/Library/Application\ Support/Code/User/snippets

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
