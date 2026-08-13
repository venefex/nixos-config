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
    ./aliases.nix
    ./bashrc-extra.nix
    ./history.nix
    ./init-extra.nix
  ];
}
