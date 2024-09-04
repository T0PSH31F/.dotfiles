{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.terminal.tools.aws;
in
{
  options.${namespace}.programs.terminal.tools.aws = with types; {
    enable = mkBoolOpt false "Whether or not to enable aws.";
  };

  config = mkIf cfg.enable {
    programs.awscli = {
      enable = true;
    };
  };
}
