{ pkgs, ... }: {
  home.packages = with pkgs; [
    # mpd
    mpc
    ncmpcpp
    imagemagickBig
    zbar
  ];
}
