{ lib, ... }:

{
  wayland.windowManager.hyprland.settings.on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("wl-paste --type text --watch cliphist store")
          hl.exec_cmd("wl-paste --type image --watch cliphist store")

          hl.exec_cmd("runapp kitten quick-access-terminal")

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
