{ config, pkgs, ... }: {
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (extensions: [ extensions.pass-otp ]);
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/.password-store";
    };
  };
}
