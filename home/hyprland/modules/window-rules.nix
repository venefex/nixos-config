{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      # Terminal (floating special workspace)
      {
        name = "terminal-special-workspace";
        match.class = "scratch-terminal";
        workspace = "special:terminal";
        float = true;
        center = true;
        size = [
          "monitor_w*0.5"
          "monitor_h*0.5"
        ];
      }

      # Terminal (floating special workspace)
      {
        name = "music-player-special-workspace";
        match.class = "scratch-musicPlayer";
        workspace = "special:musicPlayer";
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
  };
}
