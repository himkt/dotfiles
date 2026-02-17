.PHONY: macos-build macos-switch macos-brew macos-brew-gui macos-brew-optional macos-brew-himkt nixos-build nixos-switch nixos-update nixos-clean nixos-gc

# macOS targets
macos-build:
	nix build .#darwinConfigurations.macos.system

macos-switch:
	darwin-rebuild switch --flake .#macos

macos-brew:
	brew bundle --verbose --file=$(PWD)/brew/config.d/base/Brewfile

macos-brew-gui:
	brew bundle --verbose --file=$(PWD)/brew/config.d/gui/Brewfile

macos-brew-optional:
	brew bundle --verbose --file=$(PWD)/brew/config.d/optional/Brewfile

macos-brew-himkt:
	brew bundle --verbose --file=$(PWD)/brew/config.d/himkt/Brewfile

# NixOS targets
nixos-build:
	nix build .#nixosConfigurations.nixos.config.system.build.toplevel

nixos-switch:
	sudo nixos-rebuild switch --flake .#nixos

nixos-update:
	nix flake update

nixos-clean:
	sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system

nixos-gc:
	sudo nix-collect-garbage -d
