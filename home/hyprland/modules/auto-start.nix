{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store")

          hl.exec_cmd("uwsm app -- kitten quick-access-terminal")
          hl.exec_cmd("uwsm app -- fooyin", {
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
