{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellOptions = [
      "checkwinsize" # Better window resizing
      "globstar" # Recursive globbing
    ];
  };

  imports = [
    ./config/aliases.nix
    ./config/bashrc-extra.nix
    ./config/history.nix
    ./config/init-extra.nix
  ];
}
