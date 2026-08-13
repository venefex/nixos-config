{ ... }:

{
  programs.kitty = {
    enable = true;

    themeFile = "VSCode_Dark";

    font = {
      name = "MonaspiceNe NF";
      size = 11;
    };

    settings = {
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;
      mouse_hide_wait = -1;
      remember_window_size = "no";
      confirm_os_window_close = -1;
      enable_audio_bell = false;
    };

    quickAccessTerminalConfig = {
      lines = 30;
      columns = 120;
      edge = "top";
      grab_keyboard = false;
      margin_left = 600;
      margin_right = 600;
      background_opacity = 0.9;
      hide_on_focus_loss = false;
      start_as_hidden = true;
      focus_policy = "exclusive";
      app_id = "kitty-quick-access";
    };
  };
}
