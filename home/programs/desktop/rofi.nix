{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;

    plugins = [ pkgs.rofi-calc ];

    extraConfig = {
      disable-history = true;
    };

    theme = {
      "*" = {
        # Colours (descriptive names reflecting hex values and properties)
        near-black-semitrans = mkLiteral "#212121F2"; # Very dark gray, semi-transparent (~95% opacity) for window BG
        dark-gray = mkLiteral "#2A2A2A"; # Solid dark gray for input bar BG
        mid-gray-semitrans = mkLiteral "#3D3D3D80"; # Medium gray, semi-transparent (50% opacity) for messages/borders
        light-gray = mkLiteral "#E6E6E6"; # Soft light gray for default text
        medium-gray = mkLiteral "#969696"; # Mid-tone gray for prompts/secondary text
        darker-gray = mkLiteral "#4D4D4D"; # Darker gray for placeholders/tertiary text
        near-black = mkLiteral "#212121"; # Very dark gray (solid) for selected text on light BG

        font = "Noto Sans, sans-serif 12";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@light-gray";

        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        spacing = mkLiteral "0px";
      };

      window = {
        location = mkLiteral "north";
        y-offset = mkLiteral "calc(50% - 176px)";
        width = 480;
        border-radius = mkLiteral "24px";

        background-color = mkLiteral "@near-black-semitrans";
      };

      mainbox = {
        padding = mkLiteral "12px";
      };

      inputbar = {
        background-color = mkLiteral "@dark-gray";
        border-color = mkLiteral "@light-gray";

        border = mkLiteral "2px";
        border-radius = mkLiteral "16px";

        padding = mkLiteral "8px 16px";
        spacing = mkLiteral "8px";
        children = map mkLiteral [
          "prompt"
          "entry"
        ];
      };

      prompt = {
        text-color = mkLiteral "@medium-gray";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "@darker-gray";
      };

      message = {
        margin = mkLiteral "12px 0 0";
        border-radius = mkLiteral "16px";
        border-color = mkLiteral "@mid-gray-semitrans";
        background-color = mkLiteral "@mid-gray-semitrans";
      };

      textbox = {
        padding = mkLiteral "8px 24px";
      };

      listview = {
        background-color = mkLiteral "transparent";

        margin = mkLiteral "12px 0 0";
        lines = 8;
        columns = 1;

        fixed-height = false;
      };

      element = {
        padding = mkLiteral "8px 16px";
        spacing = mkLiteral "8px";
        border-radius = mkLiteral "16px";
      };

      "element normal active" = {
        text-color = mkLiteral "@light-gray";
      };

      "element alternate active" = {
        text-color = mkLiteral "@light-gray";
      };

      "element selected normal, element selected active" = {
        background-color = mkLiteral "@light-gray";
        text-color = mkLiteral "@near-black"; # Added for dark text on light selected BG
      };

      element-icon = {
        size = mkLiteral "1em";
        vertical-align = mkLiteral "0.5";
      };

      element-text = {
        text-color = mkLiteral "inherit";
      };
    };
  };
}
