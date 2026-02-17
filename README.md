# dotfiles

Unified Nix-based configuration for macOS (nix-darwin) and NixOS.

## Structure

```
dotfiles/
├── flake.nix                    # Unified flake (NixOS + nix-darwin)
├── Makefile                     # All targets for both platforms
├── hosts/
│   ├── nixos/                   # NixOS system configuration
│   ├── macos/                   # nix-darwin system configuration
│   └── modules/                 # System-level modules (keyd)
├── home/
│   ├── nixos.nix                # NixOS Home Manager entry point
│   ├── macos.nix                # macOS Home Manager entry point
│   ├── pkgs/                    # Custom packages
│   └── modules/                 # Home Manager modules
│       ├── git/                 # (shared)
│       ├── sheldon/             # (shared)
│       ├── nvim/                # (shared)
│       ├── zsh/                 # (shared)
│       ├── tmux/                # (shared)
│       ├── ghostty/             # (shared)
│       ├── uv/                  # (shared)
│       ├── mise/                # (platform-specific config)
│       ├── gcc/                 # (NixOS-only)
│       ├── java/                # (NixOS-only)
│       ├── gpg/                 # (NixOS-only)
│       └── fcitx5/              # (NixOS-only)
├── brew/                        # Homebrew Brewfiles (macOS)
└── secrets/                     # sops-nix encrypted secrets
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
