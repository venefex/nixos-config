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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      disko,
      home-manager,
      sops-nix,
      nur,
      qtengine,
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
      packages.${system}.fooyin =
        (import nixpkgs {
          inherit system;
          overlays = overlays;
        }).fooyin;

      nixosConfigurations.janus = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
          ./default.nix

          # Auto-collected overlays
          { nixpkgs.overlays = overlays; }

          disko.nixosModules.disko

          home-manager.nixosModules.home-manager
          ({ pkgs, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.alex = import ./home/default.nix;
              backupFileExtension = null;

              sharedModules = [
                inputs.noctalia.homeModules.default
                inputs.sops-nix.homeManagerModules.sops
                inputs.nixvim.homeModules.nixvim
              ];

              backupCommand = pkgs.writeShellScript "hm-backup" ''
                src="$1"
                timestamp=$(date +%Y%m%d-%H%M%S)
                mv "$src" "$src.hm-backup-$timestamp"
              '';
            };
          })

          sops-nix.nixosModules.sops

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
                "corefonts"
                "discord"
                "jetbrains.rider"
                "jetbrains.clion"
                "libvgm"
                "steam"
                "unrar"
                "vista-fonts"
                "vscode"
                "xnviewmp"
              ];
          }
        ];
      };
    };
}
