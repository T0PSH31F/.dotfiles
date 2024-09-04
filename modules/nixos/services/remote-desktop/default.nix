{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.services.remote-desktop;
in
{
  options.${namespace}.services.remote-desktop = with types; {
    enable = mkBoolOpt false "Whether or not to configure remote-desktop support.";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 3389 ];

    environment.systemPackages = with pkgs; [ kdePackages.krdc ];
  };
}
