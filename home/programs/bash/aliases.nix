{ ... }:

{
  programs.bash.shellAliases = {
    # System
    cat = "bat";
    free = "free -h";

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
    cp = "cp -i"; # Copies files with interactive prompt before overwriting.
    mv = "mv -i"; # Moves or renames files with interactive prompt before overwriting.
    rm = "rm -i"; # Removes files with interactive confirmation prompt.
    mkdir = "mkdir -p"; # Creates directories, including parent directories if needed.
    df = "df -h"; # Displays disk space usage in human-readable format.

    # NixOS
    nfu = "nix flake update --flake ~/.nixos-config";
    nrs = "sudo nixos-rebuild switch --flake ~/.nixos-config";
    nrsv = "sudo nixos-rebuild switch --flake ~/.nixos-config --verbose";
    nrsr = "sudo nixos-rebuild switch --flake ~/.nixos-config --rollback";
    nupl = "systemctl status nixos-upgrade.service";
  };
}
