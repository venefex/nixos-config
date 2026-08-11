{ ... }:

{
  wayland.windowManager.hyprland.settings.workspace_rule = [
    {
      workspace = "special:dropdown-top";
      on_created_empty = "[float; size 100% 40%; move 0 0] kitty --class kitty-dropdown";
      # Optional extras:
      # gaps_in = 0;
      # gaps_out = 0;
      # no_border = true;
    }
  ];
}
