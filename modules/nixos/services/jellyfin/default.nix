{ lib, config, namespace, ... }:

let
  cfg = config.${namespace}.services.jellyfin;
  username = config.${namespace}.user.name;
  inherit (lib) mkEnableOption mkIf;
in
{

  options.${namespace}.services.jellyfin = {
    enable = mkEnableOption "Whether or not to configure jellyfin.";
  };

  config = mkIf cfg.enable {
    services.jellyfin = {
      enable = true;
      user = username;
      openFirewall = true;
      cacheDir = "/home/t0psh31f/.cache/jellyfin";
    };
  };
}
