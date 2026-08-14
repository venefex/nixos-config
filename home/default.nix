{ ... }:

{
  imports = [
    # Core
    ./core/users.nix
    ./core/variables.nix

    # Services
    ./services/backup-cleanup.nix
    ./services/cliphist.nix
    ./services/udiskie.nix

    # Secrets
    ./security/secrets.nix

    # Programs
    ./programs/default.nix

    # Desktop
    ./desktop/cursor.nix
    ./desktop/xdg.nix

    # Hyprland
    ./hyprland/hyprland.nix

    # Noctalia
    ./desktop/noctalia.nix
  ];

  # Let Home Manager install and manage itself when in standalone mode.
  programs.home-manager.enable = true;

  # Leave this unchanged for existing Home Manager installations.
  # Only update it for a fresh installation if you intentionally want newer defaults.
  home.stateVersion = "26.05";
}
