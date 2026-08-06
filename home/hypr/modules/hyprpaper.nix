{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      systemdTarget = "hyprland-session.target";

      wallpaper = {
        monitor = "DP-1";
        path = "${../../desktop/wallpapers/mountains.jpg}";
        fit_mode = "cover";
      };

    };
  };
}
