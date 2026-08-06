{ lib, ... }:

let
  programsDir = ./home/programs;
  programModules = lib.mapAttrsToList (name: _: programsDir + "/${name}") (
    lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) (
      builtins.readDir programsDir
    )
  );
in
{
  imports = [
    # Core hm settings
    ./home/core/core.nix

    # Backup files cleaner
    ./home/services/backup-cleanup.nix

    # Desktop
    ./home/desktop/qt.nix
    ./home/desktop/cursor.nix
    ./home/desktop/xdg.nix

    # Programs (every .nix file under home/programs/)
  ]
  ++ programModules
  ++ [
    ./home/core/packages.nix
    ./home/core/variables.nix
    # Hypr
    ./home/hypr/hyprland.nix
    # Noctalia
    ./home/desktop/noctalia.nix
  ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Leave this unchanged for existing Home Manager installations.
  # Only update it for a fresh installation if you intentionally want newer defaults.
  home.stateVersion = "26.05";
}
