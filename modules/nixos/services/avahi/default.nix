{ lib, config, pkgs, namespace, ... }:

let
  cfg = config.${namespace}.services.avahi;

  inherit (lib) mkEnableOption mkIf;
in
{
  options.${namespace}.services.avahi = {
    enable = mkEnableOption "Whether or not to enable avahi.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.nssmdns ];
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
        workstation = true;
      };

      extraServiceFiles = {
        smb = ''
          <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
          <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
          <service-group>
            <name replace-wildcards="yes">%h</name>
            <service>
              <type>_smb._tcp</type>
              <port>445</port>
            </service>
          </service-group>
        '';
      };
    };
  };
}
