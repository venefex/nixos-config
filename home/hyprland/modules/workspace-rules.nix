{ ... }:

let
  workspaces = [
    "Web"
    "Documents"
    "Dev"
    "Games"
    "Misc"
  ];
in
{
  wayland.windowManager.hyprland.settings.workspace_rule =
    builtins.genList (i: {
      workspace = toString (i + 1);
      monitor = "DP-1";
      persistent = true;
      default_name = builtins.elemAt workspaces i;
    }) 5;
}
