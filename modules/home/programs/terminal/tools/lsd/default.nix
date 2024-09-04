{
  config,
  lib,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.lsd;
in
{
  imports = [ ./colors.nix ];

  options.${namespace}.programs.terminal.tools.lsd = {
    enable = mkBoolOpt false "Whether or not to enable lsd.";
  };

  config = mkIf cfg.enable {
    programs.lsd = {
      enable = true;
      enableAliases = true;
      settings = {
        date = "relative";
        # icons.when = "never";
      };
    };
  };
}
