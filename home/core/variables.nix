{ lib, ... }:

{
  home.sessionVariables = {
    # Git
    GIT_PS1_SHOWDIRTYSTATE = "1";
    GIT_PS1_SHOWSTASHSTATE = "1";
    GIT_PS1_SHOWUNTRACKEDFILES = "1";

    # Wayland
    NIXOS_OZONE_WL = "1";
  };
}
