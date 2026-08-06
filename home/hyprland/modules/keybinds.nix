{ lib, ... }:

let
  dir = ./keybinds;
  # every regular .nix file in the directory, excluding this aggregator if it ever lands there
  files = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) (
    builtins.readDir dir
  );
in
{
  imports = lib.mapAttrsToList (name: _: dir + "/${name}") files;
}
