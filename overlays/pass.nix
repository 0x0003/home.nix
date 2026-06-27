_: prev: {
  pass = prev.pass.override {
    x11Support = false;
    dmenuSupport = false;
  };
}
