{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dolphin / KIO integration
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kio-admin
    kdePackages.kservice
    kdePackages.kde-cli-tools

    # Image format support
    icoutils
    kdePackages.kimageformats
    kdePackages.qtimageformats
    kdePackages.qtsvg
    resvg

    # Theming
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons

    # Coor picker
    kdePackages.kcolorchooser

    # Files management
    kdePackages.ark
    kdePackages.kompare
    kdePackages.filelight
  ];
}
