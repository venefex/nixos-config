{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      disko,
      home-manager,
      nur,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # Automatically collect every overlay under modules/overlays/
      # Expects each entry to be a directory containing default.nix
      overlays =
        let
          overlayDirs = builtins.attrNames (builtins.readDir ./modules/overlays);
        in
        map (name: import ./modules/overlays/${name}) overlayDirs;
    in
    {
      nixosConfigurations.janus = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
          ./configuration.nix

          # Auto-collected overlays
          { nixpkgs.overlays = overlays; }

          disko.nixosModules.disko

          home-manager.nixosModules.home-manager
          ({ pkgs, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.alex = import ./home.nix;
              backupFileExtension = null;
              backupCommand = pkgs.writeShellScript "hm-backup" ''
                src="$1"
                timestamp=$(date +%Y%m%d-%H%M%S)
                mv "$src" "$src.hm-backup-$timestamp"
              '';
            };
          })

          nur.modules.nixos.default

          # replace qt6ct with the patched version in nur
          ({ ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                qt6ct = final.nur.repos.ilya-fedin.qt6ct;
                qt6Packages = prev.qt6Packages.overrideScope (
                  qfinal: qprev: {
                    qt6ct = final.nur.repos.ilya-fedin.qt6ct;
                  }
                );
              })
            ];
          })

          # === Unfree packages configuration ===
          {
            nixpkgs.config.allowUnfreePredicate =
              pkg:
              builtins.elem (nixpkgs.lib.getName pkg) [
                "steam"
                "discord"
                "jetbrains.rider"
                "jetbrains.clion"
                "libvgm"
                "unrar"
                "vscode"
                "xnviewmp"
              ];
          }
        ];
      };
    };
}
