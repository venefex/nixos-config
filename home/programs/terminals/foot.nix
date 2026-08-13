{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "MonaspiceNe NF:size=11";
        dpi-aware = "yes";
        pad = "8x8";
        term = "xterm-256color";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        alpha = 1;
        # Default dark theme (can be overridden)
        foreground = "d8dee9";
        background = "2e3440";
        regular0 = "3b4252"; # black
        regular1 = "bf616a"; # red
        regular2 = "a3be8c"; # green
        regular3 = "ebcb8b"; # yellow
        regular4 = "81a1c1"; # blue
        regular5 = "b48ead"; # magenta
        regular6 = "88c0d0"; # cyan
        regular7 = "e5e9f0"; # white
        bright0 = "4c566a"; # bright black
        bright1 = "bf616a"; # bright red
        bright2 = "a3be8c"; # bright green
        bright3 = "ebcb8b"; # bright yellow
        bright4 = "81a1c1"; # bright blue
        bright5 = "b48ead"; # bright magenta
        bright6 = "8fbcbb"; # bright cyan
        bright7 = "eceff4"; # bright white
      };

      key-bindings = {
        scrollback-up-page = "Shift+Page_Up";
        scrollback-down-page = "Shift+Page_Down";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v";
        search-start = "Control+Shift+r";
        font-increase = "Control+plus";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
      };

      search-bindings = {
        cancel = "Control+g Escape";
        find-prev = "Control+r";
        find-next = "Control+s";
      };

      mouse-bindings = {
        primary-paste = "BTN_MIDDLE";
        select-begin = "BTN_LEFT";
        select-begin-block = "Control+BTN_LEFT";
        select-extend = "BTN_RIGHT";
        select-extend-character-wise = "Control+BTN_RIGHT";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0;
      };

      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        osc8-underline = "url-mode";
      };
    };
  };
}
