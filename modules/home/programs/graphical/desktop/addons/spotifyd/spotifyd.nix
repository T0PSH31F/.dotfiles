{
  pkgs,
  config,
  namespace,
  lib,
  ...
}: {
with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.spotifyd;
in
{
  options.${namespace}.programs.graphical.desktop.addons.spotifyd = with types; {
    enable = mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
  home.packages = with pkgs; [
    spotify-tui
    playerctl
  ];

  services.playerctld.enable = true;
  services.spotifyd = {
    enable = true;
    package = pkgs.spotifyd.override {withMpris = true;};
    settings.global = {
      autoplay = true;
      backend = "pulseaudio";
      bitrate = 320;
      cache_path = "${config.xdg.cacheHome}/spotifyd";
      device_type = "computer";
      initial_volume = "100";
      password_cmd = "";
      use_mpris = true;
      username_cmd = "wrighterik77@gmail.com";
      volume_normalisation = false;
    };
  };
}
