{ pkgs, ... }: {
  home.packages = with pkgs; [
    fish
    chezmoi
    bc
    htop
    # irssi
    libqalculate
    wego
    imagemagick
    jq
    zbar
  ];
}
