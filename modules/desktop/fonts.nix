{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      jetbrains-mono
      hack-font
      cascadia-code
      monaspace
      terminus_font
    ];

    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Color Emoji"
      ];

      sansSerif = [
        "Noto Sans"
        "Noto Color Emoji"
      ];

      monospace = [
        "JetBrainsMono"
        "Noto Color Emoji"
      ];

      emoji = [ "Noto Color Emoji" ];
    };
  };
}
