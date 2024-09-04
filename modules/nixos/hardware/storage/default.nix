{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.hardware.storage;
in {
  options.${namespace}.hardware.storage = with types; {
    enable = mkBoolOpt false
      "Whether or not to enable support for extra storage devices.";
    ssdEnable = mkBoolOpt true
      "Whether or not to enable support for SSD storage devices.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nfs-utils ntfs3g fuseiso ];

    services.fstrim.enable = lib.mkDefault cfg.ssdEnable;
  };
}
