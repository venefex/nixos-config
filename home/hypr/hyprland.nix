{ ... }:

{
  # Installation is in ./modules/desktop/hyprland.nix

  imports = [
    ./modules/core.nix
    ./modules/keybindings.nix
    ./modules/monitors.nix
    ./modules/hyprpaper.nix
    ./modules/variables.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      config = {
        mod = {
          _var = "SUPER";
        };
      };
    };

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
