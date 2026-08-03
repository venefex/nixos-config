{ ... }:

{
  services.hyprpaper = {
    enable = true;
    splash = false;
    systemdTarget = "hyprland-session.target";

    wallpaper = [
      {
        monitor = "DP-1";
        fit_mode = "cover";
        path = "../../wallpapers/mountains.png";
      }
    ];
  };
}
