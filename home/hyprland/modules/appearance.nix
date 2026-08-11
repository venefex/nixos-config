{ lib, ... }:

let
  activeBorder = "rgba(238,238,238,1)";
  inactiveBorder = "rgba(33,33,33,0.6)";
in
{
  wayland.windowManager.hyprland.settings.config = {
    general = {
      gaps_in = 4;
      gaps_out = 12;
      border_size = 2;
      col = {
        active_border = {
          colors = [
            activeBorder
          ];
          angle = 45;
        };
        inactive_border = inactiveBorder;
      };

      resize_on_border = false;

      allow_tearing = false;
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "0xee1a1a1a"; # or 4008636146 if a numeric form is required
      };
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
  };
}
