{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.flake;
in
{
  options.${namespace}.programs.terminal.tools.flake = with types; {
    enable = mkBoolOpt false "Whether or not to enable flake.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      snowfallorg.flake
    ];
  };
}
