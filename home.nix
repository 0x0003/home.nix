{ lib, pkgs, username, homeDirectory, ... }: {
  home = {
    inherit username homeDirectory;
    stateVersion = "24.11";
  };

  i18n.glibcLocales = pkgs.glibcLocales.override {
    allLocales = false;
    locales = [
      "C.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  programs.home-manager.enable = true;

  imports = lib.flatten (builtins.map import [
    ./packages/default.nix
  ]);
}
