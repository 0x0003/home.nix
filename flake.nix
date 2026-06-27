{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      listFiles = dir: with builtins;
        map (x: dir + "/${x}") (sort lessThan (attrNames (readDir dir)));

      mkHome = { username, homeDirectory }: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          {
            nixpkgs.overlays = map import (listFiles ./overlays);
          }
        ];
        extraSpecialArgs = {
          inherit username homeDirectory listFiles;
        };
      };
    in
    {
      homeConfigurations.tuna = mkHome {
        username = "tuna";
        homeDirectory = "/home/tuna";
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          deadnix
          statix
          nixpkgs-fmt
          nvd
        ];
      };
    };
}
