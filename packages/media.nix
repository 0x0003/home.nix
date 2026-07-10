{ pkgs, ... }: {
  home.packages = with pkgs; [
    # mpd
    ncmpcpp
    imagemagickBig
    zbar
  ];
}
