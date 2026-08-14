{ lib, ... }:

let
  ### Default ###
  # activeBorder = {
  #   colors = [
  #     "rgba(51,204,255,0.93)"
  #     "rgba(0,255,153,0.93)"
  #   ];
  #   angle = 45;
  # };
  # inactiveBorder = "rgba(33,33,33,0.6)";

  ### White ###
  # activeBorder = {
  #   colors = [
  #     "rgba(238,238,238,1)"
  #   ];
  #   angle = 45;
  # };
  # inactiveBorder = "rgba(33,33,33,0.6)";
  ### White ###
  activeBorder = {
    colors = [
      "#cba6f7ee"
      "#f5c2e7ee"
    ];
    angle = 45;
  };
  inactiveBorder = "rgba(33,33,33,0.6)";
in
{
  wayland.windowManager.hyprland.settings.config = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 3;
      col = {
        active_border = activeBorder;
        inactive_border = inactiveBorder;
      };

      resize_on_border = false;

      allow_tearing = false;
    };

    decoration = {
      rounding = 0;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      dim_special = 0.4;
      shadow = {
        enabled = false;
        range = 4;
        render_power = 3;
        color = "0xee1a1a1a"; # or 4008636146 if a numeric form is required
      };
      blur = {
        enabled = false;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
  };
}
