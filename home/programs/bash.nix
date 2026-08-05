{ ... }:

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
      # git add + git commit
      gac() {
        git add . || return
        read -rp "Commit message: " msg
        git commit -m "$msg"
      }
    '';
  };
}
