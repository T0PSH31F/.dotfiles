{ config, lib, pkgs, inputs, namespace, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt enabled;

  cfg = config.${namespace}.programs.graphical.apps.aagl;
in
{
#  imports = [ inputs.aagl.nixosModules.default ];

  options.${namespace}.programs.graphical.apps.aagl = {
    enable = mkBoolOpt false "Whether or not to enable An Anime Game Launcher configuration.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      aagl-gtk-on-nix.anime-game-launcher
      aagl-gtk-on-nix.anime-borb-launcher
      aagl-gtk-on-nix.honkers-railway-launcher
      aagl-gtk-on-nix.honkers-launcher
      aagl-gtk-on-nix.wavey-launcher
      aagl-gtk-on-nix.sleepy-launcher
    ];
  };
}
