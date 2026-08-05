{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    # History
    historyControl = [ "ignoreboth" ];
    historySize = 1000000;
    historyFileSize = 1000000;

    shellAliases = {
      # System
      cat = "bat";
      free = "free -h"; # Shows system memory usage in human-readable format.

      # Reboot and poweroff to bios
      reboot-bios = "systemctl reboot --firmware-setup";
      poweroff-bios = "systemctl poweroff --firmware-setup";

      # File listing
      ls = "ls --color=auto"; # Displays directory contents with color highlighting.
      ll = "ls -l --color=auto"; # Shows detailed file information in long format with color.
      la = "ls -A --color=auto"; # Lists all files, including hidden ones (except . and ..), with color.
      lf = "ls -CF --color=auto"; # Lists files in columns with type indicators and color.
      lla = "ls -lA --color=auto"; # Provides long listing of all files, including hidden ones, with color.
      llh = "ls -lh --color=auto"; # Displays files in long format with human-readable sizes and color.

      # grep
      grep = "grep --color=auto"; # Searches for patterns with color-highlighted matches.
      grepv = "grep -v"; # Excludes lines matching the specified pattern.
      fgrep = "fgrep --color=auto"; # Performs fixed-string searches with color-highlighted matches.
      egrep = "egrep --color=auto"; # Searches using extended regular expressions with color-highlighted matches.

      # Navigation
      ".." = "cd .."; # Navigates up one directory level.
      "..." = "cd ../.."; # Navigates up two directory levels.

      # File management
      cp = "cp -i'"; # Copies files with interactive prompt before overwriting.
      mv = "mv -i'"; # Moves or renames files with interactive prompt before overwriting.
      rm = "rm -i'"; # Removes files with interactive confirmation prompt.
      mkdir = "mkdir -p'"; # Creates directories, including parent directories if needed.
      df = "df -h'"; # Displays disk space usage in human-readable format.

      # NixOS
      nrs = "sudo nixos-rebuild switch --flake ~/.nixos-config";
      nrsv = "sudo nixos-rebuild switch --flake ~/.nixos-config --verbose";
      nrsr = "sudo nixos-rebuild switch --flake ~/.nixos-config --rollback";
      nupl = "systemctl status nixos-upgrade.service";
    };

    shellOptions = [
      "histappend" # Append to the history file, don't overwrite it
      "checkwinsize" # Better window resizing
      "cmdhist" # Multi-line command history
      "globstar" # Recursive globbing
    ];

    bashrcExtra = ''
      # Editor
      if command -v micro >/dev/null 2>&1; then
          export EDITOR="micro"
      else
          export EDITOR="nano"
      fi

      # Set to 0 for plain-text separators without Powerline symbols
      export USE_POWERLINE=1

      # Prompt configuration
      PROMPT_DIRTRIM=2
    '';

    initExtra = ''
      # Source git prompt for __git_ps1
      source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh

      # git add + git commit
      gac() {
        git add . || return
        read -rp "Commit message: " msg
        git commit -m "$msg"
      }
    '';
  };
}
