{ pkgs, lib, ... }:

let
  aio-balanced = pkgs.writeShellScriptBin "aio-balanced" ''
    #!/usr/bin/env bash
    liquidctl --match kraken set pump speed \
      20 40  30 40  35 50  40 60  45 75  50 90  55 100

    liquidctl --match kraken set fan speed \
      20 25  35 40  40 50  45 60  50 75  55 90  60 100
  '';
in
{
  home.packages = [ pkgs.liquidctl ];

  systemd.user.services.aio-balanced = {
    Unit = {
      Description = "Initialize NZXT Kraken and set Balanced profile";
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = [
        "${pkgs.liquidctl}/bin/liquidctl initialize all"
        "${aio-balanced}/bin/aio-balanced"
      ];
      RemainAfterExit = true;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
