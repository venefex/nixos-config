{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("kitty --class scratch-terminal", {
            workspace = "special:terminal silent",
          })
          hl.exec_cmd("fooyin --class scratch-music", {
            workspace = "special:music silent",
          })
          hl.exec_cmd("discord --class scratch-messaging", {
            workspace = "special:music silent",
          })
        end
      '')
    ];
  };
}
