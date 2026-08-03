{ inputs, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-monochrome";
      };

      wallpaper = {
        enabled = false;
        # default.path = "/path/to/wallpapers/wallpaper.png";
      };
    };
  };
}
