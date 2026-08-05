{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellOptions = [
      "checkwinsize" # Better window resizing
      "globstar" # Recursive globbing
    ];

    imports = [
      ./bash/aliases.nix
      ./bash/bashrc-extra.nix
      ./bash/history.nix
      ./bash/init-extra.nix
    ];
  };
}
