{ ... }:

{
  # Installation is in ./modules/desktop/hyprland.nix

  imports = [
    ./modules/appearance.nix
    ./modules/auto-start.nix
    ./modules/input.nix
    ./modules/keybinds.nix
    ./modules/layout.nix
    ./modules/misc.nix
    ./modules/monitors.nix
    ./modules/hyprpaper.nix
    ./modules/variables.nix
    ./modules/window-rules.nix
    ./modules/workspace-rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    systemd.enable = false;
    systemd.variables = [ "--all" ];
  };
}
