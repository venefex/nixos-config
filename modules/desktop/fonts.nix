{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
     # Base / Unicode coverage
      noto-fonts

      # Programming / monospace
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
      nerd-fonts.monaspace
      nerd-fonts.sauce-code-pro
      hack-font
      cascadia-code
      terminus_font

      # UI / sans-serif
      inter
      open-sans
      ibm-plex

      # Icons
      font-awesome

      # Microsoft-compatible / metric substitutes
      carlito
      corefonts
      vista-fonts
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
