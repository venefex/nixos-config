{ inputs, ... }:

{
  home-manager.users.alex = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

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
          default.path = "/path/to/wallpapers/wallpaper.png";
        };
      };
    };
  };
}
