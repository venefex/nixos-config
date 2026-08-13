{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fooyin
  ];
}
