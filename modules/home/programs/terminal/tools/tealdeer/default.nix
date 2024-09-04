{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.tealdeer;
in
{
  options.${namespace}.programs.terminal.tools.tealdeer = with types; {
    enable = mkBoolOpt false "Whether or not to enable tealdeer.";
  };

  config = mkIf cfg.enable {
    programs.tealdeer = {
      enable = true;
      settings = {
        auto_update = true;
        directories.custom_pages_dir = ./pages;
      };
    };
  };
}
