{ pkgs, ... }: {
  home.packages = with pkgs; [
    zoxide
    sesh
    tmux
    fzf
    fd
    ripgrep
  ];
}
