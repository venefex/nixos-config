{ config, ... }:

{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets.github_ssh_key = {
      sopsFile = ./secrets/home.yaml;
      path = "${config.home.homeDirectory}/.ssh/github_ed25519";
      mode = "0600";
    };
  };

  programs.ssh = {
    enable = true;

    matchBlocks."github.com" = {
      hostname = "github.com";
      user = "git";
      identityFile = "${config.home.homeDirectory}/.ssh/github_ed25519";
      identitiesOnly = true;
    };
  };
}
