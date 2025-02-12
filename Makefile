# Makefile for dotfile configs
RED        := $(shell tput setaf 1)
NOCOLOR    := $(shell tput sgr0)

.PHONY: \
	all docs brew \
	base cli darwin gui \
	git nvim tmux uv zsh

all: clean base docs

# =========================

brew:
	$(PWD)/brew/bin/setup.sh

brew-base:
	brew bundle --verbose --quiet --no-lock --file=$(PWD)/brew/config.d/base/Brewfile

brew-optional:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/optional/Brewfile

brew-gui:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/gui/Brewfile

brew-himkt:
	brew bundle --verbose --no-lock --file=$(PWD)/brew/config.d/himkt/Brewfile

krew-base:
	kubectl krew install open-svc oidc-login ns images ctx hns stern neat

# =========================

base: git tmux zsh

darwin:
	$(PWD)/darwin/bin/setup.sh

ghostty: ghostty_clean
	$(PWD)/ghostty/bin/setup.sh

git: git_clean
	$(PWD)/git/bin/setup.sh

nvim: nvim_clean
	$(PWD)/nvim/bin/setup.sh

sheldon: sheldon_clean
	$(PWD)/sheldon/bin/setup.sh

tmux: tmux_clean
	$(PWD)/tmux/bin/setup.sh

uv: uv_clean
	curl -LsSf https://astral.sh/uv/install.sh | sh

zsh: zsh_clean
	$(PWD)/zsh/bin/setup.sh

# =========================

clean: \
	git_clean nvim_clean \
	tmux_clean zsh_clean

ghostty_clean:
	rm -rf $(HOME)/.config/ghostty

git_clean:
	rm -rf $(HOME)/.config/git/config
	rm -rf $(HOME)/.config/git/ignore

nvim_clean:
	rm -rf $(HOME)/.vimrc
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

sheldon_clean:
	rm -rf $(HOME)/.config/sheldon

tmux_clean:
	rm -rf $(HOME)/.tmux.conf

uv_clean:
	rm -rf $(HOME)/.local/bin/uv $(HOME)/.local/bin/uvx

zsh_clean:
	rm -rf $(HOME)/.zshrc

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
