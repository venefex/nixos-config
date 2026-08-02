{ config, ... }:

{
  programs.yt-dlp = {
    enable = true;

    settings = {
      paths = "${config.home.homeDirectory}/Videos";
    };
  };
}
