{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    neovim
    tree-sitter
    tree
    gh
    # vim
    gitleaks
    git-filter-repo
    shellcheck
  ];
}
