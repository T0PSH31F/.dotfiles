{ config, lib, pkgs, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.bat;
in
{
  options.${namespace}.programs.terminal.tools.bat = {
    enable = mkBoolOpt false "Whether or not to enable bat.";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;

      config = {
    #    theme = "gruvbox-dark";
        style = "auto,header-filesize";
      };

      extraPackages = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batpipe
        batwatch
        prettybat
      ];
    };

    home.shellAliases = {
      cat = "bat";
    };
  };
}
