{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Terminals
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Grave"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(dropdownTerminal)")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal2)")

      ];
    }

    # Text editors
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + T"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(textEditor)")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + T"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(textEditor2)")
      ];
    }

    # Launcher
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Space"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(launcher)")
      ];
    }

    # Launcher calculator
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Space"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(launcherCalc)")
      ];
    }

    # Clipboard history
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + H"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(clipHistory)")
      ];
    }
    # Clipboard history clear
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + H"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(clipHistoryClear)")
      ];
    }

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

    # File manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + E"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")
      ];
    }

    # Browsers
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser)")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser2)")
      ];
    }

    # Password manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + K"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(passwordManager)")
      ];
    }

    # Music player
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + A"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("music")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + A"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(musicPlayer)")
      ];
    }

    # Video player
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + V"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(videoPlayer)")
      ];
    }

    # Messaging
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + D"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("messaging")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + D"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(messaging)")
      ];
    }

    # Calculator
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + C"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(calculator)")
      ];
    }

    # Screenshot
    {
      _args = [
        "Print"
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd('satty -f - --copy-command wl-copy -o "$HOME/Pictures/Screenshots/%Y%m%d_%H%M%S.png"')'')
      ];
    }

    # Color pickers
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + P"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(colorPicker)")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + P"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(colorPicker2)")
      ];
    }
  ];
}
