{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.yahrr;
in
{
  options.${namespace}.suites.yahrr = with types; {
    enable = mkBoolOpt false "Whether or not to enable yahrr configuration.";
  };

  config = mkIf cfg.enable {
    t0psh31f = {
      services = {
        jellyfin = enabled;
        prowlarr = enabled;
        radarr = enabled;
        readarr = enabled;
        sonarr = enabled;
      };
      apps = {
        qbittorrent = {
          enable = true;
          nox.enable = true;
        };
      };
    };
  };
}
