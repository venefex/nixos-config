{ ... }:

{
  imports = [

    # Hardware scan results
    ./hardware-configuration.nix

    # Core
    ./modules/core/boot.nix
    ./modules/core/networking.nix
    ./modules/core/nix.nix
    ./modules/core/packages.nix
    ./modules/core/users.nix
    ./modules/core/locale.nix

    # Hardware
    ./modules/hardware/amd-gpu.nix
    ./modules/hardware/core.nix
    # ./modules/hardware/file-systems.nix
    ./modules/hardware/graphics.nix

    # Services
    ./modules/services/disk-management.nix
    ./modules/services/locate.nix
    ./modules/services/pipewire.nix
    ./modules/services/power-management.nix
    ./modules/services/printing.nix

    # Security
    ./modules/security/firewall.nix

    # Desktop
    ./modules/desktop/fonts.nix
    ./modules/desktop/greetd.nix
    ./modules/desktop/hyprland.nix
    ./modules/desktop/qt.nix
    ./modules/desktop/storage.nix
  ];

  system = {
    # Leave this unchanged for existing installations
    # Only update it for a fresh installation if you intentionally want newer defaults
    stateVersion = "26.05";
  };
}
