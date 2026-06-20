_: prev: {
  sesh = prev.sesh.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ./../patches/sesh-icons.patch
    ];
  });
}
