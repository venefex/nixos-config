{ ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "99-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          # "default.clock.allowed-rates" = [
          #   44100
          #   88200
          #   176400
          #   48000
          #   96000
          #   192000
          # ];
        };
      };
    };
  };

  security = {
    rtkit.enable = true;
  };
}
