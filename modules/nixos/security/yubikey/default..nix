{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.yubikey;
in
{
  options.${namespace}.security.yubikey = with types; {
    enable = mkBoolOpt true "Whether to enable yubikey.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      #yubico-pam
      #age-plugin-yubikey
      yubikey-agent
      yubikey-manager
      yubioath-flutter
      yubihsm-connector
      yubikey-manager-qt
      yubikey-touch-detector
      yubikey-personalization-gui
    ];
  };
}