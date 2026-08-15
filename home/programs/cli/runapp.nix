{ pkgs, ... }:

{
  home.packages = with pkgs; [
    runapp
  ];
}
