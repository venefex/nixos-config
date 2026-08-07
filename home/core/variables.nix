{ config, ... }:

{
  home.sessionVariables = {
    # Wayland
    NIXOS_OZONE_WL = "1";
    screenshots = "${config.home.homeDirectory}/Pictures/Screenshots";
  };
}
