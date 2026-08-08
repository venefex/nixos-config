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
              ["kitty"]             = "terminal",
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
      ];
    }

    # Kill window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + Q"'')
        (lib.generators.mkLuaInline "hl.dispatch(hl.dsp.window.kill)")
      ];
    }

    # Toggle split (dwindle only)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + J"'')
        (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'')
      ];
    }

    # Maximize window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + M"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })'')
      ];
    }

    # Fullscreen window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + F"'')
        (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })'')
      ];
    }

    # Move/resize window
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:272"'')
        (lib.generators.mkLuaInline "hl.dsp.window.drag()")
        (lib.generators.mkLuaInline "{ mouse = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + mouse:273"'')
        (lib.generators.mkLuaInline "hl.dsp.window.resize()")
        (lib.generators.mkLuaInline "{ mouse = true }")
      ];
    }

    # Window focus change
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + left"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "left" })'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + right"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "right" })'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + up"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "up" })'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + down"'')
        (lib.generators.mkLuaInline ''hl.dsp.focus({ direction = "down" })'')
      ];
    }
  ];
}
