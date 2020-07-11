# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: all done build_brew brew_bundle brew_bundle_cli brew_bundle_gui \
	fish_setup nvim_setup vscode_setup tmux_setup zsh_setup poetry_setup

all: clean setup_cui done
setup_cui: fish_setup zsh_setup tmux_setup nvim_setup poetry_setup
setup_gui: setup_cui vscode_setup
clean: fish_clean zsh_clean tmux_clean nvim_clean poetry_clean vscode_clean

build_brew:
	$(PWD)/brew/bin/install-brew.sh

brew_bundle:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_bundle_cli:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_bundle_gui:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui

# setup

fish_setup:
	$(PWD)/fish/bin/setup.sh

nvim_setup:
	$(PWD)/nvim/bin/setup.sh

poetry_setup:
	$(PWD)/poetry/bin/setup.sh

tmux_setup:
	$(PWD)/tmux/bin/setup.sh

vscode_setup:
	$(PWD)/vscode/bin/setup.sh

zsh_setup:
	$(PWD)/zsh/bin/setup.sh

# clean

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


done:
	@echo ""
	@echo "### Finish installing dotfiles!"
	@echo "Please run $(RED)source $$HOME/.zshrc$(NOCOLOR) on zsh to enable configures."
	@echo "- If you want to use nvim with extensions,"
	@echo "  please run $(RED)make nvim_setup$(NOCOLOR) (which needs pyenv)."
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
	@echo "  you can run $(RED)make nvim_setup$(NOCOLOR) to install Python and the nvim library"
	@echo ""
