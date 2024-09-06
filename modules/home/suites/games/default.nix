{ config, lib, pkgs, namespace, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt enabled;
  aagl-gtk-on-nix = import (builtins.fetchTarball { url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz"; sha256 = "sha256:0zba0vpxr0d4lfx2vlf2k5hn4m2v8ncxl1pz4ryy3m5fxzy3c96h";});
  cfg = config.${namespace}.suites.games;
in
{
  options.${namespace}.suites.games = {
    enable = mkBoolOpt false "Whether or not to enable common games configuration.";
    aagl.enable = mkBoolOpt false "Whether or not to enable An Anime Game Launcher configuration.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      bottles
      lutris
      prismlauncher
      proton-caller
      protontricks
      protonup-ng
      protonup-qt
    ];
#    ++ lib.optionals cfg.aagl.enable [
#      aagl-gtk-on-nix.anime-game-launcher
#      aagl-gtk-on-nix.anime-borb-launcher
#      aagl-gtk-on-nix.honkers-railway-launcher
#      aagl-gtk-on-nix.honkers-launcher
#      aagl-gtk-on-nix.wavey-launcher
#      aagl-gtk-on-nix.sleepy-launcher
#    ];

    t0psh31f = {
      programs = {
        terminal = {
          tools = {
            wine = enabled;
          };
        };
      };
    };
  };
}
