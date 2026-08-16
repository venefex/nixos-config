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
      "#dce1e8"
    ];
    angle = 45;
  };
  inactiveBorder = "#2b3038ff";
in
{
  wayland.windowManager.hyprland.settings.config = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
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
        enabled = true;
        size = 6;
        passes = 2;
        vibrancy = 0.15;
        new_optimizations = true;
      };
    };
  };
}
