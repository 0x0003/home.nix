{ pkgs, vscode-langservers-extracted, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    nil
    typescript
    typescript-language-server
    vscode-langservers-extracted
  ];
}
