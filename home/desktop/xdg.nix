{ lib, pkgs, ... }:

{
  nix.assumeXdg = true;

  xdg = {
    enable = true;
    mime.enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
    };
  };

  home.activation.createProgrammingDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/Programming"
  '';
}
