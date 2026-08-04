{ lib, ... }:
{
  wayland.windowManager.hyprland.settings = {
    window_rule = {
      match.class = "org.keepassxc.KeePassXC";
      float = true;
      size = [
        "monitor_w*0.6"
        "monitor_h*0.8"
      ];
      center = true;
    };
  };
}
