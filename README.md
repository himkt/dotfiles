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
└── home/
    └── nixos.nix          # Home Manager configuration
```

## Usage

### Build and Switch

```bash
# Rebuild and switch NixOS configuration
make switch

# Build without switching
make build

# Test configuration (dry-run)
make test
```

### Maintenance

```bash
# Update flake inputs
make update

# Remove old generations (older than 7 days)
make clean

# Garbage collect nix store
make gc
```

## Initial Setup

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/nixos-config
   cd ~/nixos-config
   ```

2. Update hardware configuration if needed:
   ```bash
   sudo nixos-generate-config --show-hardware-config > hosts/nixos/hardware-configuration.nix
   ```

3. Review and customize the configuration files:
   - `hosts/nixos/configuration.nix` - System-level settings
   - `home/nixos.nix` - User-level settings

4. Build and switch:
   ```bash
   make switch
   ```

## Notes

- This configuration uses `nixos-unstable` channel
- Home Manager is integrated as a NixOS module
- Username is set to `himkt`
