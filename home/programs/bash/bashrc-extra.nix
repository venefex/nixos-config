{ pkgs, ... }:

{
  programs.bash.bashrcExtra = ''
    # Editor
    if command -v micro >/dev/null 2>&1; then
        export EDITOR="micro"
    else
        export EDITOR="nano"
    fi

    # System monitoring and utility aliases
    if command -v htop >/dev/null 2>&1; then
        alias top='htop'  # If installed launches htop for interactive process monitoring .
    fi
    if command -v tree >/dev/null 2>&1; then
        alias tree='tree -C'  # If installed displays directory tree structure with color highlighting.
    fi

    # Import ps1 prompt
    source ${./bash/prompt.sh}
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
}
