{ lib, ... }:
{
  wayland.windowManager.hyprland.settings = {
    window_rule = {
      match.class = "org.keepassxc.KeePassXC";
      float = true;
      size = [
        "monitor_w*0.4"
        "monitor_h*0.5"
      ];
      centre = true;
    };
  };
}
