{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "window.zoomLevel" = 0.5;
        "editor.fontFamily" = "'MonaspiceNe NF', 'JetBrainsMono NF', 'monospace', monospace";
        "editor.fontSize" = 14;
        "workbench.iconTheme" = "vscode-icons";
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "editor.rulers" = [ 80 ];
        "security.workspace.trust.enabled" = false;
        "redhat.telemetry.enabled" = false;
      };

      extensions = with pkgs.vscode-extensions; [
        christian-kohler.path-intellisense
        foxundermoon.shell-format
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        redhat.vscode-yaml
        sumneko.lua
        tamasfe.even-better-toml
        vscode-icons-team.vscode-icons
      ];
    };
  };
}
