{ lib, config, namespace, ... }:

let
  cfg = config.${namespace}.services.readarr;

  username = config.${namespace}.user.name;

  inherit (lib) mkEnableOption mkIf;
in
{
  options.${namespace}.services.readarr = {
    enable = mkEnableOption "Whether or not to configure readarr.";
  };

  config = mkIf cfg.enable {
    services.readarr = {
      enable = true;
      user = username;
      openFirewall = true;
    };
  };
}
