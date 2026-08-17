{ lib, ... }:

{
  imports =
    let
      exclude = [
        # Format is file name inside a string: "programs.nix"
      ];

      entries = builtins.readDir ./.;
      nixFiles = lib.filterAttrs (
        name: type:
        type == "regular"
        && lib.hasSuffix ".nix" name
        && name != "default.nix"
        && !(lib.elem name exclude)
      ) entries;
    in
    lib.mapAttrsToList (name: _: ./. + "/${name}") nixFiles;
}
