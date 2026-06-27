_: prev: {
  imagemagickBig = prev.imagemagickBig.override {
    ghostscriptSupport = true;
    ghostscript = prev.ghostscript_headless;
    libX11Support = false;
    libXtSupport = false;
  };
}
