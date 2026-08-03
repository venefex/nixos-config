{ ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;
      systemdTarget = "hyprland-session.target";

      wallpaper = [
        {
          monitor = "DP-1";
          path = ../../wallpapers/mountains.jpg;
          fit_mode = "cover";
        }
      ];
    };
  };
}
