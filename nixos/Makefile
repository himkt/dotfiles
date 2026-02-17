.PHONY: switch build test update clean gc

switch:
	sudo nixos-rebuild switch --flake .#nixos

build:
	sudo nixos-rebuild build --flake .#nixos

test:
	sudo nixos-rebuild dry-build --flake .#nixos

update:
	nix flake update

clean:
	sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system

gc:
	sudo nix-collect-garbage -d
