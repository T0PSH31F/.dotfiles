{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.graphical.instant-messengers.element;
in
{
  options.${namespace}.programs.graphical.instant-messengers.element = with types; {
    enable = mkBoolOpt false "Whether or not to enable element.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ element-desktop ];
  };
}
