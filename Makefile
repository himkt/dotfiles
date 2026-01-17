.PHONY: switch build test update clean gc

# NixOS rebuild and switch
switch:
	sudo nixos-rebuild switch --flake .#nixos

# Build without switching
build:
	sudo nixos-rebuild build --flake .#nixos

# Test configuration (dry-run)
test:
	sudo nixos-rebuild dry-build --flake .#nixos

# Update flake inputs
update:
	nix flake update

# Remove old generations (older than 7 days)
clean:
	sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/system
	sudo nix-env --delete-generations +7 --profile /nix/var/nix/profiles/per-user/himkt/home-manager

# Garbage collect nix store
gc:
	sudo nix-collect-garbage -d
