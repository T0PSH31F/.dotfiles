{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.video;
in
{
  options.${namespace}.suites.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable video configuration.";
    editing.enable = mkBoolOpt false "Whether or not to enable video editing configuration.";
    jellyfin.enable = mkBoolOpt true "Whether or not to enable jellyfin configuration.";
  #  mpv.enable = mkBoolOpt true "Whether or not to enable mpv configuration.";
    recording.enable = mkBoolOpt true "Whether or not to enable video recording configuration.";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      adl
      nawk
      feh
      freetube
      fzf
      gifsicle
      html-xml-utils
      imagemagick
      imv
      kodi-wayland
      miru # Stream anime torrents, real-time with no waiting for downloads
      mpd
      popcorntime
      yt-dlp
      vlc
      vlc-bittorrent
    ]
    ++ lib.optionals cfg.jellyfin.enable [
      jellyfin-media-player
    ]
  #  ++ lib.optionals cfg.mpv.enable [
  #    mpv
  #  ]
    ++ lib.optionals cfg.editing.enable [
      kdenlive
    ];

    t0psh31f = {
      programs.graphical.apps = {
        obs.enable = cfg.recording.enable;
      };
    };
  };
}
