{ pkgs, ... }:

# Needed for yakuake
{
  home.packages = with pkgs; [
    kdePackages.kglobalaccel
  ];

  systemd.user.services.plasma-kglobalaccel = {
    Unit = {
      Description = "KDE Global Shortcuts Server";
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.kdePackages.kglobalaccel}/libexec/kglobalacceld";
      BusName = "org.kde.kglobalaccel";
      Slice = "background.slice";
      TimeoutSec = "5s";
      Restart = "on-failure";
      RestartPreventExitStatus = 1;
    };
  };
}
