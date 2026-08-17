{ lib, ... }:

{
  # Noctalia keymap heeading
  wayland.windowManager.hyprland.extraConfig = ''
    -- 1. Noctalia
  '';

  wayland.windowManager.hyprland.settings.bind = [

    # Control-center
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Home"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg panel-toggle control-center")'')
        (lib.generators.mkLuaInline ''{ description = "Control Center" }'')
      ];
    }

    # Launcher
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Space"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg panel-toggle launcher")'')
        (lib.generators.mkLuaInline ''{ description = "Noctalia: Launcher" }'')
      ];
    }

    # Settings
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F12"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg settings-toggle")'')
        (lib.generators.mkLuaInline ''{ description = "Noctalia: Settings" }'')
      ];
    }

    # Keymap
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F11"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg panel-toggle blackbartblues/keymap:panel")'')
        (lib.generators.mkLuaInline ''{ description = "Noctalia: Keymap" }'')
      ];
    }

    # Session menu
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + End"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg panel-toggle session")'')
        (lib.generators.mkLuaInline ''{ description = "Noctalia: Session" }'')
      ];
    }

    # Lock Session
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + L"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("runapp noctalia msg session lock")'')
        (lib.generators.mkLuaInline ''{ description = "Noctalia: Lock Session" }'')
      ];
    }

  ];
}
