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
  '';
}
