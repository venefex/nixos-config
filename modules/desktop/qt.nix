{ inputs, lib, pkgs, ... }:

{
  # environment.variables = {
  #   # QT_QPA_PLATFORMTHEME = lib.mkForce "qtengine";

  #   # default is kvantum, we shouldn't set it
  #   # QT_STYLE_OVERRIDE = lib.mkForce null;
  # };
  imports = [inputs.qtengine.nixosModules.default];

  programs.qtengine = {
    enable = true;

    config = {
      theme = {
        colorScheme = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
        iconTheme = "breeze-dark";
        style = "breeze";

        font = {
          family = "Noto Sans";
          size = 10;
          weight = -1;
        };

        fontFixed = {
          family = "MonaspiceNe";
          size = 10;
          weight = -1;
        };
      };

      misc = {
        singleClickActivate = false;
        menusHaveIcons = true;
        shortcutsForContextMenus = true;
      };
    };
  };
}
