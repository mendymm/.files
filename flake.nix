{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#Mendys-MacBook-Air
      darwinConfigurations."Mendys-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [
          (import ./darwin.nix)
        ];
        specialArgs = {
          inherit self;
        };
      };

      # bootstrap shell with darwin-rebuild and friends installed
      devShells.aarch64-darwin.bootstrap = nixpkgs.legacyPackages.aarch64-darwin.mkShellNoCC {
        packages = [ nix-darwin.packages.aarch64-darwin.default ];
      };
    };

}
