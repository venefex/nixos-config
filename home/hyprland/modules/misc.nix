{ ... }:

{
  wayland.windowManager.hyprland.settings.config = {
    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
      vrr = 1;
      middle_click_paste = false;
    };

    ecosystem = {
      no_update_news = false;
      no_donation_nag = true;
      enforce_permissions = false; #TODO
    };
  };
}
