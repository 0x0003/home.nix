{ pkgs, username, homeDirectory, listFiles, ... }: {
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

  imports = listFiles ./packages;
}
