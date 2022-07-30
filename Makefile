# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: all docs autohotkey brew cui cli gui emacs fish nvim vscode tmux zsh poetry

all: clean cui docs
clean: fish_clean nvim_clean poetry_clean tmux_clean zsh_clean

cui: fish nvim poetry tmux zsh


brew:
	$(PWD)/brew/bin/setup.sh

brew_cui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_cli:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_gui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui

autohotkey: autohotkey_clean
	$(PWD)/autohotkey/bin/setup.sh

cargo: cargo_clean
	$(PWD)/cargo/bin/setup.sh

cargo-atcoder: cargo-atcoder_clean
	$(PWD)/cargo-atcoder/bin/setup.sh

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

windows_terminal: windows_terminal_clean
	$(PWD)/windows-terminal/bin/setup.sh

zsh: zsh_clean
	$(PWD)/zsh/bin/setup.sh

autohotkey_clean:
	$(PWD)/autohotkey/bin/clean.sh

cargo_clean:
	rm -rf $(HOME)/.cargo/config.toml

cargo-atcoder_clean:
	rm -rf $(HOME)/Library/Application\ Support/cargo-atcoder.toml
	rm -rf $(HOME)/.config/cargo-atcoder.toml

emacs_clean:
	rm -rf $(HOME)/.emacs.d

fish_clean:
	rm -rf $(HOME)/.config/fish

git_clean:
	rm -rf $(HOME)/.config/git/ignore

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

windows_terminal_clean:
	$(PWD)/windows-terminal/bin/clean.sh

zsh_clean:
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.config/zplug
	rm -rf $(HOME)/.config/dotfiles


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
