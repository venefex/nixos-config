{ ... }:

{
  # Installation is in ./modules/desktop/hyprland.nix

  imports = [
    ./modules/core.nix
    ./modules/keybinds.nix
    ./modules/monitors.nix
    ./modules/hyprpaper.nix
    ./modules/variables.nix
    ./modules/window-rules.nix
  ];

  wayland.windowManager.hyprland = {
    settings = {
      config = {
      };
    };

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
