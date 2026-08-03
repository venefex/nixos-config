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
    inputs@{
      self,
      nixpkgs,
      disko,
      home-manager,
      nur,
      ...
    }:
    {
      nixosConfigurations.janus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          { nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ]; }
          ./configuration.nix
          disko.nixosModules.disko
          nur.modules.nixos.default

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

          # replace qt6ct with a patched version
          ({ ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                # Make both the top-level and the qt6Packages version point to the patched one
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

# How to install this patch
# https://github.com/ilya-fedin/nur-repository/tree/master/pkgs/qt6ct for qt6ct in home-manager? I already have nur enabled in my flake and home-manager has useGlobalPkgs = true.

# Here the default.nix content:

# ```.nix

# pkgs: with pkgs; with kdePackages; with qt6Packages; qt6ct.overrideAttrs(oldAttrs: rec {
#   buildInputs = oldAttrs.buildInputs ++ ([
#     qtdeclarative kconfig kcolorscheme kiconthemes
#   ]);

#   patches = [
#     ./qt6ct-shenanigans.patch
#   ];
# })

# ```
