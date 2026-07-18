_: prev: {
  ncmpcpp = prev.ncmpcpp.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ./../patches/ncmpcpp-single-line-header.patch
      ./../patches/ncmpcpp-sticker-rating.patch
      ./../patches/ncmpcpp-column-truncation-symbol.patch
      ./../patches/ncmpcpp-escape-abort-prompt.patch
    ];
    NIX_BUILD_CORES = 4;
  });
}
