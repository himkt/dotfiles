# nixos-config

NixOS and Home Manager configuration managed with Nix Flakes.

## Repository Structure

```
nixos-config/
├── flake.nix              # Main flake configuration
├── flake.lock             # Locked dependencies
├── Makefile               # Build and switch commands
├── hosts/
│   └── nixos/             # NixOS system configuration
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── home/
│   └── nixos.nix          # Home Manager configuration
└── modules/               # Modular configurations
    ├── fcitx5/            # Japanese IME
    ├── gcc/               # GCC with colored output
    ├── ghostty/           # Terminal emulator
    ├── git/               # Git configuration
    ├── gpg/               # GPG configuration
    ├── nvim/              # Neovim configuration
    ├── sheldon/           # Zsh plugin manager
    ├── tmux/              # Tmux configuration
    ├── uv/                # Python package manager
    └── zsh/               # Zsh configuration
```
