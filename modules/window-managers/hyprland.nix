{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal.extraPortals = [
    pkgs.kdePackages.xdg-desktop-portal-kde
  ];

  xdg.portal.config.common = {
    "org.freedesktop.impl.portal.FileChooser" = "kde";
  };

  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };
}
