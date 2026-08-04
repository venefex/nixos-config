{ ... }:

{
  # Installation is in ./modules/desktop/hyprland.nix

  imports = [
    ./modules/monitors.nix
    ./modules/hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
    systemd.variables = [ "--all" ];

    settings = {
      mod = {
        _var = "SUPER";
      };

      terminal = {
        _var = "runapp kitty";
      };

      config = {

      };
    };

    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
