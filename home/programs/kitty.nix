{ ... }:

{
  programs.kitty = {
    enable = true;

    themeFile = "VSCode_Dark";

    font = {
      name = "Monaspace Neon";
      size = 11;
    };

    settings = {
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;

      mouse_hide_wait = -1;

      remember_window_size = "no";
      initial_window_width = "135c";
      initial_window_height = "31c";
    };
  };
}
