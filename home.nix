{ config, pkgs, ... }:

{
  imports = [
    # Backup files cleaner
    ./home/core/hm-backup-cleanup.nix

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
    ./home/programs/qalculate.nix
    ./home/programs/tealdeer.nix
    ./home/programs/vscode.nix
    ./home/programs/yt-dlp.nix

    ./home/core/packages.nix
    ./home/core/variables.nix

    # Hypr
    ./home/hypr/hyprland.nix

    # Noctalia
    ./home/desktop/noctalia.nix
  ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";

  services = {
    hmBackupCleanup = {
      enable = true;
      prefix = "hm-backup";
      retentionDays = 30;
      calendar = "weekly";
    };
  };

  programs = {
    neovim = {
      enable = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Leave this unchanged for existing Home Manager installations.
  # Only update it for a fresh installation if you intentionally want newer defaults.
  home.stateVersion = "26.05";
}
