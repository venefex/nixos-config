{ inputs, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      wallpaper = {
        enabled = false;
        # default.path = "/path/to/wallpapers/wallpaper.png";
      };
    };
  };
}
