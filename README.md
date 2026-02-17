# dotfiles

[![macOS](https://github.com/himkt/dotfiles/actions/workflows/macos.yml/badge.svg)](https://github.com/himkt/dotfiles/actions/workflows/macos.yml)
[![NixOS](https://github.com/himkt/dotfiles/actions/workflows/nixos.yml/badge.svg)](https://github.com/himkt/dotfiles/actions/workflows/nixos.yml)

Unified Nix-based configuration for macOS (nix-darwin) and NixOS.

## Structure

```
dotfiles/
├── flake.nix          # Unified flake (NixOS + nix-darwin)
├── Makefile           # Build and setup targets
├── hosts/             # System-level configuration per platform
├── home/              # Home Manager configuration and modules
├── brew/              # Homebrew Brewfiles (macOS)
└── secrets/           # sops-nix encrypted secrets
```

## Setup

### macOS

1. Install [Nix](https://nixos.org/download/) via the [Determinate Systems installer](https://github.com/DeterminateSystems/nix-installer)
2. Clone this repository to `~/dotfiles`
3. Apply the nix-darwin configuration:
   ```
   make macos-switch
   ```
4. Install Homebrew packages:
   ```
   make macos-brew
   make macos-brew-gui
   ```

### NixOS

1. Clone this repository to `~/dotfiles`
2. Apply the NixOS configuration:
   ```
   make nixos-switch
   ```

## Makefile Targets

| Target | Description |
|--------|-------------|
| `macos-switch` | Apply nix-darwin + Home Manager configuration |
| `macos-brew` | Install base Homebrew packages |
| `macos-brew-gui` | Install GUI Homebrew packages |
| `macos-brew-optional` | Install optional Homebrew packages |
| `macos-brew-himkt` | Install personal Homebrew packages |
| `nixos-switch` | Apply NixOS + Home Manager configuration |
| `nixos-update` | Update flake inputs |
| `nixos-clean` | Delete old NixOS generations (keep last 7) |
| `nixos-gc` | Run Nix garbage collection |
