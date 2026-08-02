{ pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 24;
  };
}
