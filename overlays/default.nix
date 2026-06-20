let
  overlays = [
    ./sesh-icons.nix
  ];
in
map import overlays
