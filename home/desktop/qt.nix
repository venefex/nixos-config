{ lib, pkgs, ... }:

{
  home = {
    sessionVariables = {
      # default is qt5ct, breaks apps
      QT_QPA_PLATFORMTHEME = lib.mkForce "qt6ct";

      # default is kvantum, we shouldn't set it
      QT_STYLE_OVERRIDE = lib.mkForce null;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";

    qt6ctSettings = {
      Appearance = {
        color_scheme_path = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors";
        custom_palette = true;
        icon_theme = "breeze-dark";
        standard_dialogs = "default";
        style = "Breeze";
      };

      Fonts = {
        fixed = "\"JetBrains Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1\"";
        general = "\"Noto Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1\"";
      };

      Interface = {
        activate_item_on_single_click = true;
        buttonbox_layout = 2;
        cursor_flash_time = 1000;
        dialog_buttons_have_icons = true;
        double_click_interval = 400;
        gui_effects = "@Invalid()";
        keyboard_scheme = 2;
        menus_have_icons = true;
        show_shortcuts_in_context_menus = true;
        stylesheets = "@Invalid()";
        toolbutton_style = 4;
        underline_shortcut = true;
        wheel_scroll_lines = 3;
      };

      Troubleshooting = {
        force_raster_widgets = true;
        ignored_applications = "@Invalid()";
      };
    };
  };
}
