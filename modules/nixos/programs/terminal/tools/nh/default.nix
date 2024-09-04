{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.nh;
in
{
  options.${namespace}.programs.terminal.tools.nh = {
    enable = mkBoolOpt false "whether or mot to enable Nix-Helper";
  };

  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
    };
  };
}
