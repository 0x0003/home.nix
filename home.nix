{ lib, ... }: {
  home = {
    username = "tuna";
    homeDirectory = "/home/tuna";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  imports = lib.flatten (builtins.map import [
    ./packages/default.nix
  ]);
}
