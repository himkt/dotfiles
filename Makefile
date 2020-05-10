# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: all done build_brew brew_bundle brew_bundle_cli brew_bundle_gui \
	nvim_setup vscode_setup tmux_setup zsh_setup poetry_setup

all: clean setup_cui done
setup_cui: zsh_setup tmux_setup nvim_setup poetry_setup
setup_gui: zsh_setup tmux_setup nvim_setup poetry_setup vscode_setup

build_brew:
	$(PWD)/brew/bin/install-brew.sh

brew_bundle:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_bundle_cli:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_bundle_gui:
	brew bundle --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui

nvim_setup:
	$(PWD)/nvim/bin/setup.sh

vscode_setup:
	$(PWD)/vscode/bin/setup.sh

tmux_setup:
	$(PWD)/tmux/bin/setup.sh

zsh_setup:
	$(PWD)/zsh/bin/setup.sh

poetry_setup:
	$(PWD)/poetry/bin/setup.sh

clean:
	@echo 'remove symbolic links'
	rm -rf "$(HOME)/.vimrc"
	rm -rf "$(HOME)/.zshrc"
	rm -rf "$(HOME)/.tmux.conf"
	rm -rf "$(HOME)/.vim"
	rm -rf "$(HOME)/.config/nvim"
	rm -rf "$(HOME)/.config/coc"
	rm -rf "$(HOME)/.config/zplug"
	rm -rf "$(HOME)/.config/pypoetry"
	rm -rf "$(HOME)/Library/Application Support/pypoetry"
	@echo 'done'

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
