{ pkgs, ... }: {
  home.packages = with pkgs; [
    fish
    chezmoi
    age
    bc
    htop
    # irssi
    libqalculate
    wego
    jq
  ];
}
