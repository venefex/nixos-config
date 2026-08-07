{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Scroll through existing workspaces
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:276"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "r+1" })'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:275"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ workspace = "r-1" })'')
      ];
    }

    # Send to next/previous workspace
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + mouse:276"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = "+1" })'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + mouse:275"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.move({ workspace = "-1" })'')
      ];
    }
  ]

  # Switch workspaces | Move active window to workspace
  ++ lib.concatLists (
    lib.genList (
      i:
      let
        ws = i + 1;
        key = if ws == 10 then "0" else toString ws;
      in
      [
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + ${key}"'')
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = ${toString ws} })")
          ];
        }
        {
          _args = [
            (lib.generators.mkLuaInline ''mod .. " + SHIFT + ${key}"'')
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = ${toString ws} })")
          ];
        }
      ]
    ) 10
  );
}
