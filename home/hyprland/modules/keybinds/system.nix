{ pkgs, lib, ... }:

let
  aio-balanced = pkgs.writeShellScriptBin "aio-balanced" ''
    #!/usr/bin/env bash
    liquidctl --match kraken set pump speed \
      20 40  30 40  35 50  40 60  45 75  50 90  55 100

    liquidctl --match kraken set fan speed \
      20 25  35 40  40 50  45 60  50 75  55 90  60 100
  '';

  aio-performance = pkgs.writeShellScriptBin "aio-performance" ''
    #!/usr/bin/env bash
    liquidctl --match kraken set pump speed \
      20 40  30 40  35 50  40 60  45 75  50 90  55 100

    liquidctl --match kraken set fan speed \
      20 40  35 45  40 55  45 70  50 85  55 95  60 100
  '';
in
{
  wayland.windowManager.hyprland.settings.bind = [
    # Exit hyprland
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + SHIFT + E"'')
        (lib.generators.mkLuaInline ''
          hl.dsp.exec_cmd(
            "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
          )
        '')
      ];
    }

    # AIO
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + PAGE_DOWN"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${aio-balanced}/bin/aio-balanced")'')
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''mod .. " + PAGE_UP"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${aio-performance}/bin/aio-performance")'')
      ];
    }

    # Audio
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioNext"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl next")'')
        (lib.generators.mkLuaInline "{ locked = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioPlay"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'')
        (lib.generators.mkLuaInline "{ locked = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioPause"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl play-pause")'')
        (lib.generators.mkLuaInline "{ locked = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioPrev"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("playerctl previous")'')
        (lib.generators.mkLuaInline "{ locked = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioRaiseVolume"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioLowerVolume"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioMute"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86AudioMicMute"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }

    # Screen brightness
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86MonBrightnessUp"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }
    {
      _args = [
        (lib.generators.mkLuaInline ''"XF86MonBrightnessDown"'')
        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-")'')
        (lib.generators.mkLuaInline "{ locked = true, repeating = true }")
      ];
    }

  ];
}
