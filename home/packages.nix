{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Applications
    kdePackages.ark
    kdePackages.dolphin
    kdePackages.konsole
    kdePackages.okular
    kdePackages.kcalc
    kdePackages.kompare
    xnviewmp

    # Dolphin integration
    kdePackages.dolphin-plugins
    kdePackages.ffmpegthumbs
    kdePackages.kio-admin
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kservice

    # Qt / Gnome theming
    nur.repos.ilya-fedin.qt6ct # patched qt6ct to enable kde theming
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    nwg-look

    # Image format support
    icoutils
    kdePackages.qtsvg
    kdePackages.qtimageformats
    kdePackages.kimageformats
    resvg

    # (kdePackages.qt6ct.overrideAttrs (oldAttrs: {
    #   patches = (oldAttrs.patches or [ ]) ++ [
    #     ./patches/qt6ct-0.11.patch # Relative path works in pure mode
    #   ];
    #   name = "qt6ct-kde";
    # }))

    # Misc
    runapp
    pavucontrol
  ];
}
