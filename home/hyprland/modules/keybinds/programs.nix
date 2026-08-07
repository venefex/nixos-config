{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # {
    #   _args = [
    #     (lib.generators.mkLuaInline ''mod .. " + Q"'')
    #     (lib.generators.mkLuaInline ''
    #       function()
    #         local w = hl.get_active_window()

    #         if w ~= nil and w.class == "scratch-terminal" then
    #           hl.dispatch(hl.dsp.workspace.toggle_special("terminal"))
    #           return
    #         end

    #         hl.dispatch(hl.dsp.window.close())
    #       end
    #     '')
    #   ];
    # }
    # Terminals
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Return"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("terminal")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Return"'')
        (lib.generators.mkLuaInline ''hl.dsp.workspace.toggle_special("terminal")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Grave"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitten quick_access_terminal\")")
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
        (lib.generators.mkLuaInline ''mod .. " + P"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(passwordManager)")
      ];
    }

    # Video player
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + V"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(videoPlayer)")
      ];
    }

    # Calculator
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + C"'')
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(calculator)")
      ];
    }

    # Task manager
    {
      _args = [
        (lib.generators.mkLuaInline ''"CTRL + SHIFT + ESCAPE"'')
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

  ];
}
