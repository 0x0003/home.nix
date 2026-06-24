Tracks [nixos-unstable](https://github.com/NixOS/nixpkgs/tree/nixos-unstable).

Manages **packages only**. Dotfiles are managed by chezmoi and live in [another repo](https://github.com/0x0003/dotfiles), which pulls this one as a git submodule.

## Quick start

Standalone:
```sh
git clone https://github.com/0x0003/dotfiles.nix ~/.config/home-manager
nix --extra-experimental-features "nix-command flakes" run "home-manager/master#home-manager" -- switch --flake ~/.config/home-manager
```

See [0x0003/dotfiles](https://github.com/0x0003/dotfiles) for full package.

## Dev shell

Activates automatically with direnv. Provides `deadnix`, `nixpkgs-fmt`,
`statix`, `nvd`.

## Why not Nix + home-manager for dotfiles?

First and most important: Nix doesn't run on Windows, which I frequently have to use.

Second, too much friction for my liking. *Every* config change requires
a full re-evaluation: making small edits feels awful. The setup is also
tied to Nix being installed on the machine.
Chezmoi keeps a source copy of my dotfiles and can sync changes both
ways on demand - no expensive evaluation or build steps required.
It also works regardless of Nix availability: it's a single statically
linked binary that doesn't require root access even for bootstrapping.

That said, Nix is great for its devshells and overlays. It allows
for atomic upgrades, and mixing different package sources is trivial.
Those features make it worth keeping around.

