{ pkgs, ... }:

{
  programs.bash.initExtra = ''
    # Source git prompt for __git_ps1
    source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh

    # git add + git commit
    gac() {
      git add . || return
      read -rp "Commit message: " msg
      git commit -m "$msg"
    }

    nixos-update() (
      cd ~/.nixos-config || exit

      nix flake update || exit

      git diff --quiet -- flake.lock && {
        echo "flake.lock is already up to date."
        exit 0
      }

      git diff -- flake.lock
      read -rp "Continue with rebuild? [y/N] " answer
      [[ "$answer" =~ ^[Yy]$ ]] || exit 0

      sudo nixos-rebuild switch --flake . &&
      git add flake.lock &&
      git commit -m "Update system inputs"
    )
  '';
}
