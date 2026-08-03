{ pkgs, ... }:

{
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    interval = "daily";
    prunePaths = [
      "/tmp"
      "/var/tmp"
      "/var/cache"
      "/var/lock"
      "/var/run"
      "/var/spool"
      "/var/store"
      "/nix/store"
      "/nix/var/log/nix"
    ];
  };
}
