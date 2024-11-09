{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.hardware.sensors;
in
{
  options.${namespace}.hardware.sensors = with types; {
    enable = mkBoolOpt false "Whether or not to enable sensors support.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lm_sensors
    ];

    programs.coolercontrol.enable = false;
  };
}
