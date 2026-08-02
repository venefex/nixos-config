{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "window.zoomLevel" = 0.5;
        "editor.fontFamily" = "'JetBrains Mono', 'monospace', monospace";
        "editor.fontSize" = 14;
        "workbench.iconTheme" = "vscode-icons";
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
      };

      extensions = with pkgs.vscode-extensions; [
        vscode-icons-team.vscode-icons
        christian-kohler.path-intellisense
        sumneko.lua
        tamasfe.even-better-toml
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
      ];
    };
  };
}
