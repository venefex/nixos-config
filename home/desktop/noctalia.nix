{ inputs, ... }:
{
  programs.noctalia = {
    enable = true;

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
