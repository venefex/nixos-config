{ ... }:

{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "onedark";
      update_ms = 1000;
      show_battery = false;
    };
  };
}
