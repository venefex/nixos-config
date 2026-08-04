{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      # qalculate-qt
      {
        match.class = "qalculate-qt";
        float = true;
        center = true;
      }

      # KeePassXC
      {
        match.class = "org.keepassxc.KeePassXC";
        float = true;
        size = [
          "monitor_w*0.5"
          "monitor_h*0.8"
        ];
        center = true;
      }

      # mpv
      {
        match.class = "mpv";
        float = true;
        size = [
          1280
          720
        ];
        center = true;
      }
    ];
  };
}
