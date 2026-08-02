{ pkgs, ... }:

{
  time = {
    timeZone = "Europe/Rome";
    hardwareClockInLocalTime = false;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_MEASUREMENT = "it_IT.UTF-8";
      LC_MONETARY = "it_IT.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "it_IT.UTF-8";
      LC_TIME = "en_DK.UTF-8"; # ISO date format
    };
  };

  console = {
    earlySetup = true;
    packages = [ pkgs.terminus_font ];
    font = "ter-v32n";
    keyMap = "us";
  };
}
