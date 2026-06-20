{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    neovim
    tree-sitter
    # vim
  ];
}
