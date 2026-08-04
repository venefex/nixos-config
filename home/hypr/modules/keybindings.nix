{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Terminal
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
      ];
    }

    # Launcher
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Space"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(launcher)")
      ];
    }

    # File manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + E"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")
      ];
    }

        # Browser
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser)")
      ];
    }

            # Browser 2
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " +SHIFT + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser2)")
      ];
    }
  ];
}
