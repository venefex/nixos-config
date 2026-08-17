{ ... }:

{
  programs.rmpc = {
    enable = true;

    config = ''
      (
        enable_mouse: true,
        max_fps: 60,
      )
    '';
  };
}
