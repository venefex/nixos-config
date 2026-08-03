{ pkgs, ... }:

{
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  # Use KDE's XDG application menu so KDE applications integrate correctly
  # outside of Plasma (e.g. Hyprland).
  environment.etc."xdg/menus/applications.menu".source =
    "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # Try running these if the open with menu is still empty:
  # rm -f ~/.cache/ksycoca*
  # rm -f ~/.cache/ksycoca6*
  # XDG_MENU_PREFIX=plasma- kbuildsycoca6 --noincremental
}
