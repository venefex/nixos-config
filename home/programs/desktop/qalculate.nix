{ pkgs, ... }:

{
  programs.qalculate = {
    enable = true;
    package = pkgs.qalculate-gtk;

    settings = {
      General = {
        clear_history_on_exit = 1;
      };
      Mode = {
        local_currency_conversion = 1;
      };
    };
  };

  # GTK-specific UI settings (fonts, keypad currency button, etc.)
  # are stored in qalculate-gtk.cfg, which the home-manager module does not manage
  xdg.configFile."qalculate/qalculate-gtk.cfg".text = ''
    [General]
    clear_history_on_exit=1
    local_currency_conversion=1
    latest_button_currency=EUR
    use_custom_result_font=1
    custom_result_font=Noto Sans SemiBold 13
    use_custom_expression_font=1
    custom_expression_font=Noto Sans Regular 13
    use_custom_status_font=1
    custom_status_font=Noto Sans Regular 10
    use_custom_keypad_font=1
    custom_keypad_font=Noto Sans Regular 12
    use_custom_history_font=1
    custom_history_font=Noto Sans Regular 11
    use_custom_application_font=0
  '';
}
