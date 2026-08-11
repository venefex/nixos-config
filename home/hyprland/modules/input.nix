{ ... }:

{
  wayland.windowManager.hyprland.settings.config.input = {
    kb_layout = "us";
    kb_variant = "altgr-intl";
    kb_model = "";
    kb_options = "fkeys:basic_13-24,lv3:ralt_switch"; # F13-F14,AltGr
    kb_rules = "";
    numlock_by_default = false;

    follow_mouse = 1;
    sensitivity = -0.8;
    accel_profile = "adaptive";

    touchpad = {
      natural_scroll = false;
    };
  };

  wayland.windowManager.hyprland.settings.gesture = {
    fingers = 3;
    direction = "horizontal";
    action = "workspace";
  };
}
