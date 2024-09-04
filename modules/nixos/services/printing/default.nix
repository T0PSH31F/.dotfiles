{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.services.printing;
in
{
  options.${namespace}.services.printing = with types; {
    enable = mkBoolOpt false "Whether or not to configure printing support.";
  };

  config = mkIf cfg.enable {
    services.printing = {
      enable = true;
      browsing = true;

      drivers = [ pkgs.cnijfilter2 ];
    };

    environment.systemPackages = with pkgs; [
      skanpage
    ];
  };
}
