{ ... }:

{
  programs.hyprpaper = {
    enable = true;
    splash = false;

    wallpaper = [
      {
        monitor = "DP-1";
        fit_mode = "cover";
        path = "../../wallpapers/mountains.png";
      }
    ];
  };
}
