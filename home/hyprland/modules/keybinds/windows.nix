{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
    # Quit window (or hides terminal special workspace)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Q"'')
        (lib.generators.mkLuaInline ''
          function()
            local w = hl.get_active_window()
            local specials = {
              ["org.fooyin.fooyin"] = "music",
              ["vesktop"]           = "messaging",
            }
            if w ~= nil and specials[w.class] then
              hl.dispatch(hl.dsp.workspace.toggle_special(specials[w.class]))
              return
            end
            hl.dispatch(hl.dsp.window.close())
          end
        '')
        (lib.generators.mkLuaInline ''{ description = "Window: Quit" }'')
      ];
    }

    # Kill window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Q"'')
        (lib.generators.mkLuaInline "hl.dispatch(hl.dsp.window.kill)")
        (lib.generators.mkLuaInline ''{ description = "Window: Kill" }'')
      ];
    }

    # Toggle split (dwindle only)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + J"'')
        (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'')
        (lib.generators.mkLuaInline ''{ description = "Toggle Split" }'')
      ];
    }

    # Toggle floating window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F"'')
        (lib.generators.mkLuaInline "hl.dsp.window.float()")
        (lib.generators.mkLuaInline ''{ description = "Window: Toggle Floating" }'')
      ];
    }

    # Maximize window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + M"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Maximize" }'')
      ];
    }

    # Fullscreen window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Backspace"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Fullscren" }'')
      ];
    }

    # Move/resize window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:272"'')
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        (lib.generators.mkLuaInline ''{ mouse = true, description = "Window: Move" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:273"'')
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        (lib.generators.mkLuaInline ''{ mouse = true, description = "Window: Resize" }'')
      ];
    }

    # Window focus change
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + left"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "left" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Focus Left" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + right"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "right" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Focus Right" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + up"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "up" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Focus Up" }'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + down"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "down" })'')
        (lib.generators.mkLuaInline ''{ description = "Window: Focus Down" }'')
      ];
    }

    # Cycle windows
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + Tab"'')
        (lib.generators.mkLuaInline "hl.dsp.window.cycle_next()")
        (lib.generators.mkLuaInline ''{ description = "Window: Cycle" }'')
      ];
    }
  ];
}
