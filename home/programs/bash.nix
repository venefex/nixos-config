{ ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      nrs = "sudo nixos-rebuild switch --flake ~/.nixos-config";
      nrsv = "sudo nixos-rebuild switch --flake ~/.nixos-config --verbose";
      nrsr = "sudo nixos-rebuild switch --flake ~/.nixos-config --rollback";
      nupl = "systemctl status nixos-upgrade.service";
    };
  };
}
