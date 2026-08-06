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

    nixos-update() {
      local original_dir
      original_dir=$(pwd) || return 1

      cd ~/.nixos-config || return 1

      nix flake update || { cd "$original_dir"; return 1; }

      if git diff --quiet -- flake.lock; then
        echo "flake.lock is already up to date."
        cd "$original_dir"
        return 0
      fi

      git diff -- flake.lock
      read -rp "Continue with rebuild? [y/N] " answer
      [[ "$answer" =~ ^[Yy]$ ]] || { cd "$original_dir"; return 0; }

      if sudo nixos-rebuild switch --flake .; then
        git add flake.lock
        git commit -m "Update system inputs"
      fi

      cd "$original_dir"
    }
  '';
}
