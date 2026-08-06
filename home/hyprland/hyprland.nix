{ ... }:

{
  # Installation is in ./modules/desktop/hyprland.nix

  imports = [
    ./modules/autostart.nix
    ./modules/keybinds.nix
    ./modules/monitors.nix
    ./modules/hyprpaper.nix
    ./modules/variables.nix
    ./modules/window-rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    systemd.variables = [ "--all" ];
  };

  wayland.windowManager.hyprland = {
    settings = {
      config = {
      };
    };

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
