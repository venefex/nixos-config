{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Launcher
    {
      _args = [
        (lib.generators.mkLuaInline ''"SUPER + SUPER_L"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle control-center")'')
        (lib.generators.mkLuaInline ''{ release = true }'')
      ];
    }

    # Launcher
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Space"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle launcher")'')
      ];
    }

    # Settings
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F12"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg settings-toggle")'')
      ];
    }

    # Session menu
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + End"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("noctalia msg panel-toggle session")'')
      ];
    }
  ];
}
