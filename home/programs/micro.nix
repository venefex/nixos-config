{ ... }:

{
  programs.micro = {
    enable = true;

    settings = {
      truecolor = "on";
      colorscheme = "atom-dark";

      # Sensible defaults
      tabsize = 4;
      tabstospaces = true;
      autosu = true;
      saveundo = true;
      rmtrailingws = true;
    };
  };
}
