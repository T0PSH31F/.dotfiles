{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.wine;
in
{
  options.${namespace}.programs.terminal.tools.wine = with types; {
    enable = mkBoolOpt false "Whether or not to enable wine.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # winePackages.unstable
      winetricks
      wine64Packages.unstable
    ];
  };
}
