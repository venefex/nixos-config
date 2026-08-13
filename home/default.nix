{ ... }:

{
  imports = [
    # Core
    ./home/core/users.nix
    ./home/core/variables.nix

    # Services
    ./home/services/backup-cleanup.nix
    ./home/services/cliphist.nix
    ./home/services/udiskie.nix

    # Secrets
    ./home/security/secrets.nix

    # Programs
    ./programs/default.nix

    # Desktop
    ./home/desktop/qt.nix
    ./home/desktop/cursor.nix
    ./home/desktop/xdg.nix

    # Hyprland
    ./home/hyprland/hyprland.nix

    # Noctalia
    ./home/desktop/noctalia.nix
  ];

  # Let Home Manager install and manage itself when in standalone mode.
  programs.home-manager.enable = true;

  # Leave this unchanged for existing Home Manager installations.
  # Only update it for a fresh installation if you intentionally want newer defaults.
  home.stateVersion = "26.05";
}
