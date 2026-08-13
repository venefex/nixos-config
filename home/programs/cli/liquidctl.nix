{ pkgs, ... }:

{

  home.packages = with pkgs; [
    liquidctl
  ];
}
