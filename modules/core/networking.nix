{ ... }:

{
  networking = {
    hostName = "janus";

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = false;
    };

    wireless = {
      iwd = {
        enable = true;
        settings = {
          General.Country = "IT";
        };
      };
    };
  };
}
