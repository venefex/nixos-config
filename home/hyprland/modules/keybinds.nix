{ lib, ... }:

let
  dir = ./keybinds;

  files = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) (
    builtins.readDir dir
  );
in
{
  imports = map (name: dir + "/${name}") (builtins.attrNames files);
}
