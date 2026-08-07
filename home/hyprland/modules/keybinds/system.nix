{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Task manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Home"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(taskManager)")
      ];
    }

    # Volume control
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F10"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(volumeControl)")
      ];
    }

    # Exit hyprland
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " SHIFT + E"'')
        (lib.generators.mkLuaInline ''
          hl.dsp.exec_cmd(
            "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
          )
        '')
      ];
    }
  ];
}
