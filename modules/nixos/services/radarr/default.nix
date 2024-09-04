{ lib, config, namespace, ... }:

let
  cfg = config.${namespace}.services.radarr;

  username = config.${namespace}.user.name;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.${namespace}.services.radarr = {
    enable = mkEnableOption "Whether or not to configure radarr.";
  };

  config = mkIf cfg.enable {
    services.radarr = {
      enable = true;
      user = username;
      openFirewall = true;
    };
  };
}
