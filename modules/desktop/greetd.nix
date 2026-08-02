{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = with pkgs; {
        command = "${uwsm}/bin/uwsm start hyprland.desktop";
        user = "alex";
      };
      default_session = with pkgs; {
        command = "${greetd}/bin/agreety --cmd $SHELL";
        user = "alex";
      };
    };
  };
}
