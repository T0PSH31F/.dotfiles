{ config, lib, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.lazygit;
in
{
  options.${namespace}.programs.terminal.tools.lazygit = {
    enable = mkBoolOpt false "Whether or not to enable lazygit.";
  };

  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
    };

    home.shellAliases = {
      lg = "lazygit";
    };
  };
}
