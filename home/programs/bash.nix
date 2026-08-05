{ ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      # System
      cat = "bat";

      # NixOS
      nrs = "sudo nixos-rebuild switch --flake ~/.nixos-config";
      nrsv = "sudo nixos-rebuild switch --flake ~/.nixos-config --verbose";
      nrsr = "sudo nixos-rebuild switch --flake ~/.nixos-config --rollback";
      nupl = "systemctl status nixos-upgrade.service";
    };

    initExtra = ''
      gac() {
        git add . || return
        read -rp "Commit message: " msg
        git commit -m "$msg"
      }
    '';
  };
}
