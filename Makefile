# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: all docs \
	cargo git \
	nvim tmux uv zsh

cargo: cargo_clean
	$(PWD)/cargo/bin/setup.sh

git: git_clean
	$(PWD)/git/bin/setup.sh

nix: nix_clean
	$(PWD)/nix/bin/setup.sh

nvim: nvim_clean
	$(PWD)/nvim/bin/setup.sh

poetry: poetry_clean
	$(PWD)/poetry/bin/setup.sh

tmux: tmux_clean
	$(PWD)/tmux/bin/setup.sh

uv: uv_clean
	curl -LsSf https://astral.sh/uv/install.sh | sh

wezterm: wezterm_clean
	$(PWD)/wezterm/bin/setup.sh

zsh: zsh_clean
	$(PWD)/zsh/bin/setup.sh

# =========================

clean: \
	cargo_clean \
	git_clean nvim_clean \
	tmux_clean zsh_clean

cargo_clean:
	rm -rf $(HOME)/.cargo/config.toml

git_clean:
	rm -rf $(HOME)/.config/git/config
	rm -rf $(HOME)/.config/git/ignore

nix_clean:
	# TODO(himkt); uninstall nix itself.
	rm -rf $(HOME)/.config/nix

nvim_clean:
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

tmux_clean:
	rm -rf $(HOME)/.tmux.conf

uv_clean:
	rm -rf $(HOME)/.local/bin/uv $(HOME)/.local/bin/uvx

wezterm_clean:
	rm -rf $(HOME)/.wezterm.lua

zsh_clean:
	rm -rf $(HOME)/.zshrc

# =========================

nix_apply:
	darwin-rebuild switch --flake $(PWD)/nix/config.d

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
	@echo "- If you want to use linuxbrew/homebrew, please run $(RED)make brew-cui$(NOCOLOR)."
	@echo "- Please run $(RED)make brew$(NOCOLOR) before if you have not installed brew yet"
	@echo "- Additionally, $(RED)make brew-optional$(NOCOLOR) installs optional packages"
	@echo ""
	@echo "---"
	@echo ""
	@echo "### Python"
	@echo "- After $(RED)make brew, make brew-cui, source $$HOME/.zshrc$(NOCOLOR),"
	@echo "  you can run $(RED)make nvim$(NOCOLOR) to install Python and the nvim library"
	@echo ""
