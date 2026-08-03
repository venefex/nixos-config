{ lib, pkgs, ... }:

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

    dataFile."color-schemes/BreezeDark.colors".source =
      "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";

    dataFile."color-schemes/BreezeLight.colors".source =
      "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeLight.colors";

    dataFile."color-schemes/BreezeClassic.colors".source =
      "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeClassic.colors";
  };

  home.activation.createProgrammingDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/Programming"
  '';
}
