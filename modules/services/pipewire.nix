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

    wireplumber.extraConfig = {
      "99-alsa-soft-mixer" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                "device.name" = "~alsa_card.*";
              }
            ];
            actions = {
              update-props = {
                "api.alsa.soft-mixer" = true;
              };
            };
          }
        ];
      };
    };
  };

  security.rtkit.enable = true;
}
