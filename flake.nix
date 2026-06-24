{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pinned-pkgs.url = "github:NixOS/nixpkgs/766734c5e85ec9c6ae5b6b726501a242a949302f";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, pinned-pkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHome = { username, homeDirectory }: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          {
            nixpkgs.overlays = import ./overlays;
          }
        ];
        extraSpecialArgs = {
          inherit username homeDirectory;
          inherit (pinned-pkgs.legacyPackages.${system}) vscode-langservers-extracted;
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
