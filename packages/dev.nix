{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    direnv
    neovim
    tree-sitter
    # vim
  ];
}
