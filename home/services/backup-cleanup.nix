{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.services.hmBackupCleanup;
in
{
  options.services.hmBackupCleanup = {
    enable = lib.mkEnableOption "automatic cleanup of old Home Manager backup files";

    prefix = lib.mkOption {
      type = lib.types.str;
      default = "hm-backup";
      description = "Prefix used in backup filenames (the part after the original filename).";
    };

    retentionDays = lib.mkOption {
      type = lib.types.ints.positive;
      default = 30;
      description = "Delete backup files older than this many days.";
    };

    calendar = lib.mkOption {
      type = lib.types.str;
      default = "weekly";
      description = "systemd OnCalendar expression for when the cleanup should run.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.cleanup-hm-backups = {
      Unit = {
        Description = "Clean up old Home Manager backup files (prefix: ${cfg.prefix})";
      };
      Service = {
        Type = "oneshot";
        ExecStart = ''
          ${pkgs.findutils}/bin/find "$HOME" \
            -type f \
            -name "*.${cfg.prefix}-*" \
            -mtime +${toString cfg.retentionDays} \
            -delete
        '';
      };
    };

    systemd.user.timers.cleanup-hm-backups = {
      Unit = {
        Description = "Timer for cleaning old Home Manager backups";
      };
      Timer = {
        OnCalendar = cfg.calendar;
        Persistent = true;
        RandomizedDelaySec = "30m";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };

  services.hmBackupCleanup = {
    enable = true;
    prefix = "hm-backup";
    retentionDays = 30;
    calendar = "weekly";
  };
}
