Tracks [nixos-unstable](https://github.com/NixOS/nixpkgs/tree/nixos-unstable).

Manages **packages only**; [dotfiles and secrets](https://github.com/0x0003/dotfiles) are managed by chezmoi.

## Quick start

Standalone:
```sh
git clone https://github.com/0x0003/dotfiles.nix ~/.config/home-manager
nix --extra-experimental-features "nix-command flakes" run "home-manager/master#home-manager" -- switch --flake .#tuna
```

See [0x0003/dotfiles](https://github.com/0x0003/dotfiles) for full package.

## Dev shell

Activates automatically with direnv. Provides `deadnix`, `nixpkgs-fmt`,
`statix`, `nvd`.

## Why not Nix + home-manager for dotfiles?

Too much friction for my liking: *every* config change requires a full
re-evaluation: making small edits feels awful; the setup is tied
to Nix being installed on the machine.
chezmoi applies instantly (in symlink mode), and it works regardless
of Nix availability: it's a single statically-linked binary that
doesn't require root access even for bootstrapping.

That said, Nix is great for its devshells and overlays. It
allows for partial upgrades, and mixing different package
sources is trivial.
Those features make it worth keeping around.

