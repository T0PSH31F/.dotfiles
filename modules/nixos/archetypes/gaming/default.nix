{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.archetypes.gaming;
in
{
  options.${namespace}.archetypes.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming archetype.";
  };

  config = mkIf cfg.enable {
    t0psh31f.suites = {
    #  common = enabled;
    #  desktop = enabled;
      games = enabled;
    };
  };
}
