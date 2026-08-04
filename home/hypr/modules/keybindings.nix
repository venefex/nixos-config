{ ... }:

{
  wayland.windowManager.hyprland.settings.bind = {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + Return\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(terminal)")
    ];
  };
}
