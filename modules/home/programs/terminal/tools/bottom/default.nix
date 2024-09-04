{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.bottom;
in
{
  options.${namespace}.programs.terminal.tools.bottom = with types; {
    enable = mkBoolOpt false "Whether or not to enable bottom.";
  };

  config = mkIf cfg.enable {
    programs.bottom = {
      enable = true;
    };

    home.shellAliases = {
      htop = "btm -b";
    };
  };
}
