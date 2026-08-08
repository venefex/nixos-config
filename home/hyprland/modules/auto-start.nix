{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("kitty", {
            workspace = "special:terminal silent",
          })

          hl.exec_cmd("fooyin", {
            workspace = "special:music silent",
          })

          hl.exec_cmd("vesktop", {
            workspace = "special:messaging silent",
          })
        end
      '')
    ];
  };
}
