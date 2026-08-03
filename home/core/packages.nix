{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Archive managers
    kdePackages.ark

    # Browsers
    brave

    # Calculators
    kdePackages.kcalc

    # Diff / compare tools
    kdePackages.kompare

    # Document viewers
    kdePackages.okular

    # Dolphin / KIO integration
    kdePackages.dolphin-plugins
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kio-admin
    kdePackages.kservice

    # File managers
    kdePackages.dolphin

    # Hardware tools
    liquidctl
    vial

    # Image format support
    icoutils
    kdePackages.kimageformats
    kdePackages.qtimageformats
    kdePackages.qtsvg
    resvg

    # Image viewers
    xnviewmp

    # Music players
    fooyin

    # Terminals
    kdePackages.konsole

    # Theming
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    nwg-look

    # Utilities
    pavucontrol
    runapp
  ];
}
