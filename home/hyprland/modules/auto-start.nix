{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          -- Prefer plain kitty so the PID is the window process.
          -- --class gives a stable match for the window rule.
          hl.exec_cmd("kitty --class scratch-terminal", {
            workspace = "special:terminal silent",
          })
        end
      '')
    ];
  };
}
