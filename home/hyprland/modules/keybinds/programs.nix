{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Main Terminal
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
        (lib.generators.mkLuaInline ''{ description = "Terminal" }'')
      ];
    }

    # Main Terminal (floating)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(floatingTerminal)")
        (lib.generators.mkLuaInline ''{ description = "Terminal (Floating)" }'')
      ];
    }
    # Main Terminal (dropdown)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Grave"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(dropdownTerminal)")
        (lib.generators.mkLuaInline ''{ description = "Terminal (Dropdown)" }'')
      ];
    }

    # Backup Terminal
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + ALT + Return"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(backupTerminal)")
        (lib.generators.mkLuaInline ''{ description = "Terminal (Backup)" }'')
      ];
    }

    # Text editors
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + T"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(textEditor)")
        (lib.generators.mkLuaInline ''{ description = "Text editor" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + T"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(textEditor2)")
        (lib.generators.mkLuaInline ''{ description = "Text editor 2" }'')
      ];
    }

    # Clipboard history
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + H"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(clipHistory)")
        (lib.generators.mkLuaInline ''{ description = "Clipboard History" }'')
      ];
    }
    # Clipboard history clear
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + H"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(clipHistoryClear)")
        (lib.generators.mkLuaInline ''{ description = "Clipboard History Clear" }'')
      ];
    }

    # Task manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Escape"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(taskManager)")
        (lib.generators.mkLuaInline ''{ description = "Control Center" }'')
      ];
    }

    # Volume control
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F10"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(volumeControl)")
        (lib.generators.mkLuaInline ''{ description = "Volume Control" }'')
      ];
    }

    # File manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + E"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(fileManager)")
        (lib.generators.mkLuaInline ''{ description = "File Manager" }'')
      ];
    }

    # Browsers
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser)")
        (lib.generators.mkLuaInline ''{ description = "Browser" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + B"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(browser2)")
        (lib.generators.mkLuaInline ''{ description = "Browser (Secondary)" }'')
      ];
    }

    # Password manager
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + K"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(passwordManager)")
        (lib.generators.mkLuaInline ''{ description = "Password Manager" }'')
      ];
    }

    # Music player
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + A"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("music")'')
        (lib.generators.mkLuaInline ''{ description = "Special Workspace: Music" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + A"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(musicPlayer)")
        (lib.generators.mkLuaInline ''{ description = "Music Player" }'')
      ];
    }

    # Video player
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + V"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(videoPlayer)")
        (lib.generators.mkLuaInline ''{ description = "Video Player" }'')
      ];
    }

    # Messaging
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + D"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("messaging")'')
        (lib.generators.mkLuaInline ''{ description = "Special Workspace: Messaging" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + D"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(messaging)")
        (lib.generators.mkLuaInline ''{ description = "Messaging" }'')
      ];
    }

    # Calculator
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + C"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(calculator)")
        (lib.generators.mkLuaInline ''{ description = "Calculator" }'')
      ];
    }

    # Screenshot (automatic)
    {
      _args = [
        "Print"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(screenShot)")
        (lib.generators.mkLuaInline ''{ description = "Screenshot" }'')
      ];
    }

    # Screenshot (utility)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Print"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(screenShotEdit)")
        (lib.generators.mkLuaInline ''{ description = "Screenshot Editor" }'')
      ];
    }

    # Color pickers
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + P"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(colorPicker)")
        (lib.generators.mkLuaInline ''{ description = "Color Picker (Simple)" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + P"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(colorPicker2)")
        (lib.generators.mkLuaInline ''{ description = "Color Picker (Advanced)" }'')
      ];
    }
  ];
}
