{ pkgs, ... }:

{
  programs.nixvim = {
    enable = false;

    # colorschemes.gruvbox.enable = true;
  };

  home.packages = with pkgs; [
    neovim
  ];
}
