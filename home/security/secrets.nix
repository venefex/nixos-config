{ config, ... }:
{
  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    secrets = {
      github_ssh_key = {
        sopsFile = ../../secrets/home.yaml;
        path = "${config.home.homeDirectory}/.ssh/github_ed25519";
        mode = "0600";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        ForwardAgent = "no";
        ServerAliveInterval = 60;
        ServerAliveCountMax = 3;
      };

      "github.com" = {
        Hostname = "github.com";
        User = "git";
        IdentityFile = "${config.home.homeDirectory}/.ssh/github_ed25519";
        IdentitiesOnly = true;
      };
    };
  };
}
