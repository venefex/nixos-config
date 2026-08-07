{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.bind = [
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
  ];
}
