{ config, pkgs, ... }:

{
  imports = [
    # Core
    ./home/core/packages.nix
    ./home/core/variables.nix

    # Services
    ./home/services/backup-cleanup.nix

    # Desktop
    ./home/desktop/qt.nix
    ./home/desktop/cursor.nix
    ./home/desktop/xdg.nix

    # Programs
    ./home/programs/bash.nix
    ./home/programs/bat.nix
    ./home/programs/btop.nix
    # ./home/programs/cmus.nix
    ./home/programs/firefox.nix
    ./home/programs/git.nix
    ./home/programs/keepassxc.nix
    ./home/programs/kitty.nix
    ./home/programs/lesspipe.nix
    # ./modules/home/programs/librewolf.nix
    ./home/programs/micro.nix
    ./home/programs/mpv.nix
    ./home/programs/neovim.nix
    ./home/programs/qalculate.nix
    ./home/programs/rofi.nix
    ./home/programs/tealdeer.nix
    ./home/programs/vscode.nix
    ./home/programs/yt-dlp.nix

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
