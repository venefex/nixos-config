{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      kdePackages.xdg-desktop-portal-kde
    ];

    config.common = {
      default = [
        "hyprland"
        "kde"
      ];
      "org.freedesktop.impl.portal.FileChooser" = "kde";
    };
  };

  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";
  };
}
