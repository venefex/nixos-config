{ config, ... }:

{
  programs.satty = {
    enable = true;

    settings = {
      general = {
        fullscreen = true;
        corner-roundness = 0;
        copy-command = "wl-copy";
        actions-on-enter = [
          "save-to-file"
          "exit"
        ];
        initial-tool = "brush";
        output-filename = "${config.home.homeDirectory}/Pictures/Screenshots/%Y%m%d_%H%M%S.png";
      };
      color-palette = {
        palette = [
          "#1c1c1e" # black
          "#e5e5ea" # white
          "#ff453a" # red
          "#ff9f0a" # orange
          "#ffd60a" # yellow
          "#32d74b" # green
          "#64d2ff" # cyan
          "#0a84ff" # blue
          "#bf5af2" # purple
        ];
      };
    };
  };
}
