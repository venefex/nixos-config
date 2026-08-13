# nixos-config

Declarative NixOS configuration managed with flakes.

This repository contains a single-host NixOS configuration for the machine named **janus**, together with a corresponding Home Manager setup for the user **alex**.

## Features

- **Flakes**-based configuration
- **Home Manager** integrated as a NixOS module
- **Disko** for declarative disk partitioning
- **sops-nix** for secrets management
- **Hyprland** window manager
- **Noctalia** desktop shell
- **Nixvim** for Neovim configuration
- Automatic collection of overlays from `modules/overlays/`
- Support for selected unfree packages

## Structure
.
├── flake.nix                 # Flake definition and inputs
├── default.nix               # Main NixOS module imports
├── disko-config.nix          # Disk partitioning configuration
├── hardware-configuration.nix
├── home/                     # Home Manager configuration
│   ├── default.nix
│   ├── core/
│   ├── desktop/
│   ├── hyprland/
│   ├── programs/
│   ├── security/
│   └── services/
├── modules/                  # NixOS modules
│   ├── core/
│   ├── desktop/
│   ├── hardware/
│   ├── overlays/
│   ├── security/
│   ├── services/
│   └── window-managers/
└── secrets/                  # Encrypted secrets (sops-nix)


## Usage

Rebuild the system with:

```bash
sudo nixos-rebuild switch --flake .#janus
```

Update flake inputs:

```bash
nix flake update
```

## License

This project is licensed under the [GNU General Public License v3.0](LICENSE).
