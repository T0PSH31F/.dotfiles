{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.terminal.tools.qmk;
in
{
  options.${namespace}.programs.terminal.tools.qmk = with types; {
    enable = mkBoolOpt false "Whether or not to enable QMK";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qmk
    ];

    services.udev.packages = with pkgs; [
      qmk-udev-rules
    ];
  };
}
