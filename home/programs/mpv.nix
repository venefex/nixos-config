{ ... }:

{
  programs.mpv = {
    enable = true;

    config = {
      profile = "gpu-hq";
      vo = "gpu-next";
      gpu-api = "vulkan";

      keep-open = "yes";

      screenshot-format = "png";
      screenshot-directory = "~/Pictures/";
      screenshot-template = "%F-%p";

      target-prim = "bt.709";
      target-trc = "gamma2.2";
      tone-mapping = "clip";
      target-colorspace-hint = "no";
      hdr-compute-peak = "no";

      loop-playlist = "inf";

    };
    bindings = {
      "WHEEL_UP" = "seek 10";
      "WHEEL_DOWN" = "seek -10";
    };
  };
}
