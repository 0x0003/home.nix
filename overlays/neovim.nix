_: prev: {
  neovim = prev.neovim.override {
    waylandSupport = false;
  };
}
