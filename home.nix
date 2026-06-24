{ lib, username, homeDirectory, ... }: {
  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  imports = lib.flatten (builtins.map import [
    ./packages/default.nix
  ]);
}
