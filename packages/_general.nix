{ pkgs, ... }: {
  home.packages = with pkgs; [
    fish
    chezmoi
    age
    bc
    btop
    # irssi
    libqalculate
    wego
    jq
  ];
}
