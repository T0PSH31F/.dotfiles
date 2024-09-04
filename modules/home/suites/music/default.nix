{ pkgs, config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.music;
in
{
  options.${namespace}.suites.music = with types; {
    enable = mkBoolOpt false "Whether or not to enable music configuration.";
    mixing.enable = mkBoolOpt false "Whether or not to enable music mixing configuration.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      amberol
      spotify
      t0psh31f.pocketcasts
      t0psh31f.yt-music
    ]
    ++ lib.optionals cfg.mixing.enable [
      ardour
    ];
  };
}
