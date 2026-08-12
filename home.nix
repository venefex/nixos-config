{ lib, ... }:

let
  programsDir = ./home/programs;

  # Basenames to skip (with or without the .nix suffix)
  excludedPrograms = [
    "librewolf.nix"
  ];

  programFiles = lib.filterAttrs (
    name: type: type == "regular" && lib.hasSuffix ".nix" name && !(lib.elem name excludedPrograms)
  ) (builtins.readDir programsDir);
  programModules = map (name: programsDir + "/${name}") (builtins.attrNames programFiles);
in
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

    # Desktop
    ./home/desktop/qt.nix
    ./home/desktop/cursor.nix
    ./home/desktop/xdg.nix

    # Hyprland
    ./home/hyprland/hyprland.nix

    # Noctalia
    ./home/desktop/noctalia.nix

  ] # Programs (auto-imported, minus exclusions)
  ++ programModules
  ++ [
    ./home/core/packages.nix
  ];

  # Let Home Manager install and manage itself when in standalone mode.
  programs.home-manager.enable = true;

  # Leave this unchanged for existing Home Manager installations.
  # Only update it for a fresh installation if you intentionally want newer defaults.
  home.stateVersion = "26.05";
}
