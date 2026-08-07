{ ... }:

{
  wayland.windowManager.hyprland.settings.config = {
    general.layout = "dwindle";

    dwindle = {
      force_split = 2;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    scrolling = {
      fullscreen_on_one_column = true;
    };
  };
}
