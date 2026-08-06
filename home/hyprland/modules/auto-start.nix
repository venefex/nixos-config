{ lib, ... }:

{
  on = {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("kitty", {
            workspace = "special:terminal silent",
            float = true,
            center = true,
            size = { "monitor_w*0.5", "monitor_h*0.5" },
          })
        end
      '')
    ];
  };
}
