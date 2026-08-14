{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libreoffice-fresh
    colloid-gtk-theme
  ];
}
