{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      # qalculate-gtk
      {
        match.class = "qalculate-gtk";
        float = true;
        center = true;
      }

      # KeePassXC
      {
        match.class = "org.keepassxc.KeePassXC";
        float = true;
        center = true;
        size = [
          "monitor_w*0.5"
          "monitor_h*0.8"
        ];
      }

      # MissionCenter
      {
        match.class = "io.missioncenter.MissionCenter";
        float = true;
        center = true;
        size = [
          "monitor_w*0.5"
          "monitor_h*0.5"
        ];
      }

      # mpv
      {
        match.class = "mpv";
        float = true;
        center = true;
        size = [
          "monitor_w*0.5"
          "monitor_h*0.5"
        ];
      }
    ];
  };
}
