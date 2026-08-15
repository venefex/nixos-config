{ lib, ... }:

{
  imports =
    let
      entries = builtins.readDir ./.;
      nixFiles = lib.filterAttrs (
        name: type: type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix"
      ) entries;
    in
    lib.mapAttrsToList (name: _: ./. + "/${name}") nixFiles;
}
