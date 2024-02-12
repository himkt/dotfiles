# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: \
	all docs brew \
	cui cli gui \
	autohotkey_clean cargo git \
	nvim poetry tmux zsh

all: clean cui docs

# =========================

brew:
	$(PWD)/brew/bin/setup.sh

brew_cui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile

brew_cli:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.cli

brew_gui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/Brewfile.gui

# =========================

cui: cargo git nvim poetry tmux zsh

autohotkey: autohotkey_clean
	$(PWD)/autohotkey/bin/setup.sh

cargo: cargo_clean
	$(PWD)/cargo/bin/setup.sh

git: git_clean
	$(PWD)/git/bin/setup.sh

nvim: nvim_clean
	$(PWD)/nvim/bin/setup.sh

poetry: poetry_clean
	$(PWD)/poetry/bin/setup.sh

sheldon: sheldon_clean
	$(PWD)/sheldon/bin/setup.sh

tmux: tmux_clean
	$(PWD)/tmux/bin/setup.sh

zsh: zsh_clean
	$(PWD)/zsh/bin/setup.sh

# =========================

clean: \
	cargo_clean \
	git_clean nvim_clean poetry_clean \
	tmux_clean zsh_clean

autohotkey_clean:
	$(PWD)/autohotkey/bin/clean.sh

cargo_clean:
	rm -rf $(HOME)/.cargo/config.toml

git_clean:
	rm -rf $(HOME)/.config/git/config
	rm -rf $(HOME)/.config/git/ignore

nvim_clean:
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

poetry_clean:
	rm -rf $(HOME)/.config/pypoetry
	rm -rf $(HOME)/Library/Application\ Support/pypoetry

sheldon_clean:
	rm -rf $(HOME)/.config/sheldon

tmux_clean:
	rm -rf $(HOME)/.tmux.conf

zsh_clean:
	rm -rf $(HOME)/.zshrc
	rm -rf $(HOME)/.config/zplug

# =========================

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
