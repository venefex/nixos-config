{ ... }:

{
  programs.satty = {
    enable = true;

    settings = {
      general = {
        fullscreen = true;
        corner-roundness = 0;
        copy-command = "wl-copy";
        initial-tool = "brush";
        output-filename = "/tmp/test-%Y-%m-%d_%H:%M:%S.png";
      };
      color-palette = {
        palette = [
          "#00ffff"
          "#a52a2a"
          "#dc143c"
          "#ff1493"
          "#ffd700"
          "#008000"
        ];
      };
    };
  };
}
