{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Use the newest stable kernel

    # Configuration API for wireless 802.11 devices
    kernelModules = [ "cfg80211" ];
    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom=IT
    '';

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        edk2-uefi-shell.enable = true;
        memtest86.enable = true;
      };

      timeout = 3;
      efi.canTouchEfiVariables = true;
    };

    tmp = {
      useTmpfs = true;
      tmpfsSize = "50%";
    };

    # Quiet boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "rd.systemd.show_status=false"
    ];
  };
}
