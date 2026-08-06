{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf;

    policies = {
      SearchEngines = {
        Default = "Brave";

        Add = [
          {
            Name = "Brave";
            URLTemplate = "https://search.brave.com/search?q={searchTerms}";
            IconURL = "https://brave.com/favicon.ico";
            Alias = "@brave";
          }
        ];

        # Remove = [
        #   "Google"
        #   "Bing"
        #   "Amazon.it"
        #   "eBay"
        # ];
      };
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        # sponsorblock
        return-youtube-dislikes
      ];

      settings = {
        # Enable DRM if you watch Netflix, Spotify Web, etc.
        "browser.eme.ui.enabled" = false;

        # Enable dark theme
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";

        # Restore previous session
        "browser.startup.page" = 3;

        # Warn before closing a window with multiple tabs
        "browser.tabs.warnOnClose" = true;

        # Warn when quitting with multiple windows/tabs
        "browser.warnOnQuit" = true;
        "browser.warnOnQuitShortcut" = true;

        # Always ask where to save downloaded files
        "browser.download.useDownloadDir" = true;

        # Ctrl+Tab cycles through tabs in MRU (Most Recently Used) order
        "browser.ctrlTab.sortByRecentlyUsed" = true;

        # Never offer to translate these languages
        "browser.translations.neverTranslateLanguages" = "it,en";

        # Disable annoying recommendations
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;

        # Don't ask to be the default browser every launch
        "browser.shell.checkDefaultBrowser" = false;

        # Always use HTTPS when possible
        "dom.security.https_only_mode" = true;

        # Native file picker on Linux
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # Use the same search engine in private windows
        "browser.search.separatePrivateDefault" = false;

        # Disable Pocket
        "extensions.pocket.enabled" = false;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "GitHub";
            url = "https://github.com";
          }
          {
            name = "NixOS Search";
            url = "https://search.nixos.org/packages";
          }
          {
            name = "Home Manager Options";
            url = "https://home-manager-options.extranix.com/";
          }
        ];
      };
    };
  };
}
