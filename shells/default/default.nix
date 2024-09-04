{ inputs
, mkShell
, pkgs
, system
, ...
}:
let
  inherit (inputs) snowfall-flake;
in
mkShell {
  buildInputs = with pkgs; [
    hydra-check
    nix-inspect
    nix-bisect
    nix-diff
    nix-health
    nix-index
    nix-melt
    nix-prefetch-git
    nix-search-cli
    nix-tree
    nixpkgs-hammering
    nixpkgs-lint
    snowfall-flake.packages.${system}.flake
  ];

  shellHook = ''
    echo 🔨 Howdy Ho felow Straw Hat!! Welcome aboard the Thousand Sunny!


  '';
}
