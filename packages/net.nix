{ pkgs, ... }: {
  home.packages = with pkgs; [
    proxychains
    nmap
    wget
  ];
}
