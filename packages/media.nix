{ pkgs, ... }: {
  home.packages = with pkgs; [
    # mpd
    # listenbrainz-mpd
    mpc
    ncmpcpp
    imagemagickBig
    zbar
  ];
}
