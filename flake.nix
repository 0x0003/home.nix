{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pinned-pkgs.url = "github:NixOS/nixpkgs/ed67bc86e84e51d4a88e73c7fd36006dc876476f";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, pinned-pkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}.appendOverlays (import ./overlays);
    in
    {
      homeConfigurations.tuna = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit (pinned-pkgs.legacyPackages.${system}) vscode-langservers-extracted;
        };
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
