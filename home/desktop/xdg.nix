{ config, lib, pkgs, ... }:

{
  nix.assumeXdg = true;

  xdg = {
    enable = true;
    mime.enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
    };
  };

  # Use KDE's XDG application menu so KDE applications integrate correctly
  # outside of Plasma (e.g. Hyprland).
  xdg.configFile."menus/applications.menu".source =
  "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # Create specified directories if not present
  home.activation.createProgrammingDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${config.home.homeDirectory}/Programming"
    mkdir -p "${config.home.homeDirectory}/Pictures/Screenshots"
  '';
}
