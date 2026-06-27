_: prev: {
  zbar = prev.zbar.override {
    withXorg = false;
    enableVideo = false;
  };
}
