{ ... }:

{
  wayland.windowManager.hyprland.settings.window_rule = [
    # Music (floating special workspace)
    {
      name = "music-special-workspace";
      match.class = "org.fooyin.fooyin";
      workspace = "special:music";
      float = true;
      center = true;
      size = [
        "monitor_w*0.5"
        "monitor_h*0.8"
      ];
    }

    # Messaging (floating special workspace)
    {
      name = "messaging-special-workspace";
      match.class = "vesktop";
      workspace = "special:messaging";
      float = true;
      center = true;
      size = [
        "monitor_w*0.6"
        "monitor_h*0.8"
      ];
    }

    # KeePassXC
    {
      name = "keepassxc-floating";
      match.class = "org.keepassxc.KeePassXC";
      float = true;
      center = true;
      size = [
        "monitor_w*0.5"
        "monitor_h*0.8"
      ];
    }

    # qalculate-gtk
    {
      name = "qalculate-floating";
      match.class = "qalculate-gtk";
      float = true;
      center = true;
    }

    # MissionCenter
    {
      name = "missioncenter-floating";
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
      name = "mpv-floating";
      match.class = "mpv";
      float = true;
      center = true;
      size = [
        "monitor_w*0.5"
        "monitor_h*0.5"
      ];
    }

    # pwvucontrol
    {
      name = "pwvucontrol-floating";
      match.class = "com.saivert.pwvucontrol";
      float = true;
      center = true;
      size = [
        "monitor_w*0.5"
        "monitor_h*0.5"
      ];
    }

    # Ignore maximize requests from all apps
    {
      name = "suppress-maximize-events";
      match.class = ".*";
      suppress_event = "maximize";
    }

    # Fix dragging issues with XWayland
    {
      name = "fix-xwayland-drags";

      match = {
        class = "^$";
        title = "^$";
        xwayland = true;
        float = true;
        fullscreen = false;
        pin = false;
      };

      no_focus = true;
    }
  ];
}
