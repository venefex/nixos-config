# { config, pkgs, lib, ... }:

# let
#   # Customise these overrides as needed.
#   # Available themeVariants: "default" | "purple" | "pink" | "red" | "orange" | "yellow" | "green" | "teal" | "grey" | "all"
#   # Available colorVariants: "standard" | "light" | "dark"
#   # Available sizeVariants:  "standard" | "compact"
#   # Available tweaks:        "nord" | "dracula" | "gruvbox" | "everforest" | "catppuccin" | "black" | "rimless" | "normal" | "float" | "all"
#   colloidTheme = pkgs.colloid-gtk-theme.override {
#     themeVariants = [ "default" ];   # accent colour (blue by default)
#     colorVariants = [ "dark" ];      # dark variant
#     sizeVariants  = [ "standard" ];  # or "compact"
#     tweaks        = [ ];             # e.g. [ "nord" "rimless" "black" ]
#   };

#   # Resulting theme name follows the pattern produced by the install script.
#   # Common values:
#   #   Colloid-Dark
#   #   Colloid-Dark-Compact
#   #   Colloid-Dark-Compact-Nord
#   #   Colloid-Purple-Dark
#   #   Colloid-Dark-Catppuccin
#   # Inspect the package after building if the name is uncertain:
#   #   ls $(nix-build -A colloid-gtk-theme)/share/themes
#   themeName = "Colloid-Dark";
# in
# {
#   # ------------------------------------------------------------------
#   # GTK configuration
#   # ------------------------------------------------------------------
#   gtk = {
#     enable = true;

#     theme = {
#       name    = themeName;
#       package = colloidTheme;
#     };

#     iconTheme = {
#       name    = "Colloid-Dark";
#       package = pkgs.colloid-icon-theme; # optionally override scheme/colorVariants
#     };

#     font = {
#       name = "Noto Sans";                    # change to your preferred font
#       size = 11;
#     };

#     # Prefer dark theme globally
#     colorScheme = "dark";

#     # GTK 3 extra settings
#     gtk3.extraConfig = {
#       gtk-application-prefer-dark-theme = true;
#       gtk-button-images                 = true;
#       gtk-menu-images                   = true;
#       gtk-toolbar-style                 = "GTK_TOOLBAR_BOTH_HORIZ";
#       gtk-toolbar-icon-size             = "GTK_ICON_SIZE_LARGE_TOOLBAR";
#       gtk-enable-event-sounds           = false;
#       gtk-enable-input-feedback-sounds  = false;
#       gtk-xft-antialias                 = 1;
#       gtk-xft-hinting                   = 1;
#       gtk-xft-hintstyle                 = "hintslight";
#       gtk-xft-rgba                      = "rgb";
#     };

#     # GTK 4 extra settings
#     gtk4.extraConfig = {
#       gtk-application-prefer-dark-theme = true;
#       gtk-button-images                 = true;
#       gtk-menu-images                   = true;
#     };
#   };

#   # ------------------------------------------------------------------
#   # Session variable (helps many applications pick up the theme)
#   # ------------------------------------------------------------------
#   home.sessionVariables = {
#     GTK_THEME = themeName;
#   };

#   # ------------------------------------------------------------------
#   # Optional but recommended: dconf settings for GNOME / libadwaita apps
#   # ------------------------------------------------------------------
#   dconf.settings = {
#     "org/gnome/desktop/interface" = {
#       gtk-theme     = themeName;
#       icon-theme    = "Colloid-Dark";
#       cursor-theme  = "phinger-cursors-light";
#       color-scheme  = "prefer-dark";
#       font-name     = "Noto Sans 11";
#     };
#   };
# }

{
  config,
  pkgs,
  lib,
  ...
}:

{
  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = null; # already installed on the system
    };

    iconTheme = {
      name = "breeze-dark";
      package = null; # already installed on the system
    };

    cursorTheme = {
      name = "phinger-cursors-light";
      package = null; # already installed on the system
      size = 24;
    };

    font = {
      name = "Noto Sans";
      size = 11;
    };

    colorScheme = "dark";

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-menu-images = true;
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-enable-event-sounds = false;
      gtk-enable-input-feedback-sounds = false;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-menu-images = true;
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Breeze-Dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Breeze-Dark";
      icon-theme = "breeze-dark";
      cursor-theme = "phinger-cursors-light";
      color-scheme = "prefer-dark";
      font-name = "Noto Sans 11";
    };
  };
}
