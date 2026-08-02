{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = false; # Set true if you don't use Sync
      DisableAccounts = false;
      DisableFormHistory = false;
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;

      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = true;
      PasswordManagerEnabled = false;

      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      HTTPSOnlyMode = "enabled";

      SearchSuggestEnabled = false;

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        FirefoxLabs = false;
        MoreFromMozilla = false;
        SkipOnboarding = true;
        UrlbarInterventions = false;
        WhatsNew = false;
      };

      SanitizeOnShutdown = {
        Cache = true;
        Cookies = false;
        Downloads = false;
        FormData = false;
        History = false;
        Locked = false;
        Sessions = false;
        SiteSettings = false;
      };

      ExtensionSettings = {
        "*" = {
          installation_mode = "allowed";
        };

        # Optional: install uBlock Origin automatically.
        # Replace the install_url with the current AMO URL if needed.
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # Restore previous session
        "browser.startup.page" = 3;

        # Enhanced Tracking Protection
        "browser.contentblocking.category" = "strict";

        # HTTPS
        "dom.security.https_only_mode" = true;

        # DNS over HTTPS
        "network.trr.mode" = 2;
        "network.trr.uri" = "https://mozilla.cloudflare-dns.com/dns-query";

        # Telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;

        # Crash reports
        "breakpad.reportURL" = "";
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        # Studies
        "app.shield.optoutstudies.enabled" = false;

        # Safe Browsing
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;

        # Search
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.searches" = false;

        # Speculative connections
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;

        # WebRTC
        "media.peerconnection.enabled" = true;

        # Geolocation
        "geo.enabled" = false;

        # Beacon API
        "beacon.enabled" = false;

        # Clipboard events
        "dom.event.clipboardevents.enabled" = false;

        # Referers
        "network.http.referer.XOriginPolicy" = 2;
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        # Network partitioning
        "privacy.partition.network_state" = true;

        # Global Privacy Control
        "privacy.globalprivacycontrol.enabled" = true;

        # OCSP
        "security.OCSP.enabled" = 1;

        # Captive portal
        "network.captive-portal-service.enabled" = false;

        # Normandy
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        # Downloads
        "browser.download.useDownloadDir" = true;

        # Tabs
        "browser.tabs.warnOnClose" = false;
        "browser.warnOnQuitShortcut" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;

        # Picture-in-Picture
        "media.videocontrols.picture-in-picture.enabled" = false;

        # Website appearance
        "layout.css.prefers-color-scheme.content-override" = 0;

        # Translation
        "browser.translations.enable" = true;
        "browser.translations.automaticallyPopup" = true;
        "browser.translations.neverTranslateLanguages" = "en,it";

        # New tab
        "browser.newtabpage.activity-stream.hideLogo" = true;
        "browser.newtabpage.activity-stream.logowordmark.alwaysVisible" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.widgets.weather.enabled" = true;
        "browser.newtabpage.activity-stream.weather.query" = 211738; # Teramo
        "browser.newtabpage.activity-stream.weather.staticData.enabled" = false;
      };

      search = {
        force = true;
        default = "brave";

        engines = {
          "brave" = {
            urls = [
              {
                template = "https://search.brave.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            name = "Brave";
            definedAliases = [ "@brave, @b" ];
            icon = "https://brave.com/favicon.ico";

          };

          "youtube" = {
            urls = [
              {
                template = "https://www.youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            name = "YouTube";
            definedAliases = [ "@youtube, @yt" ];
            icon = "https://www.youtube.com/favicon.ico";
          };

          "grokipedia" = {
            urls = [
              {
                template = "https://grokipedia.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            name = "Grokipedia";
            definedAliases = [ "@grokipedia, @gp" ];
            icon = "https://grokipedia.com//favicon.ico";
          };

          "ecosia".metaData.hidden = true;
          "perplexity".metaData.hidden = true;
          "qwant".metaData.hidden = true;
        };
      };
    };
  };
}
