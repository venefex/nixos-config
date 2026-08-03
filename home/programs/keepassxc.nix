{ ... }:

{
  programs.keepassxc = {
    enable = true;

    settings = {
      General = {
        ConfigVersion = 2;
      };

      Security = {
        LockDatabaseIdle = false;
        LockDatabaseMinimize = false;
        LockDatabaseScreenLock = true;
        LockDatabaseSuspend = true;
        IconDownloadFallback = true;
      };

      FdoSecrets = {
        Enabled = false;
      };

      GUI = {
        ApplicationTheme = "dark";
        FontSizeOffset = -1;
        TrayIconAppearance = "monochrome-light";
      };
    };
  };
}
