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

            if w ~= nil and w.class == "scratch-terminal" then
              hl.dispatch(hl.dsp.workspace.toggle_special("terminal"))
              return
            end

            hl.dispatch(hl.dsp.window.close())
          end
        '')
      ];
    }

    # Toggle split (dwindle only)
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + J"'')
        (lib.generators.mkLuaInline ''hl.dsp.layout("togglesplit")'')
      ];
    }
  ];
}
