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
        "50%"
        "80%"
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
        "60%"
        "80%"
      ];
    }

    # qalculate-gtk
    {
      name = "qalculate-floating";
      match.class = "qalculate-gtk";
      float = true;
      center = true;
    }

    # KeePassXC
    {
      name = "keepassxc-floating";
      match.class = "org.keepassxc.KeePassXC";
      float = true;
      center = true;
      size = [
        "50%"
        "80%"
      ];
    }

    # MissionCenter
    {
      name = "missioncenter-floating";
      match.class = "io.missioncenter.MissionCenter";
      float = true;
      center = true;
      size = [
        "50%"
        "50%"
      ];
    }

    # mpv
    {
      name = "mpv-floating";
      match.class = "mpv";
      float = true;
      center = true;
      size = [
        "50%"
        "50%"
      ];
    }

    # pwvucontrol
    {
      name = "pwvucontrol-floating";
      match.class = "com.saivert.pwvucontrol";
      float = true;
      center = true;
      size = "50% 50%";
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
