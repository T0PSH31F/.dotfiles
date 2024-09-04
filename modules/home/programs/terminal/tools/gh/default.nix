{
  lib,
  config,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.programs.terminal.tools.gh;
in {
  options.${namespace}.programs.terminal.tools.gh = with types; {
    enable = mkBoolOpt false "Enable GitHub CLI";
  };

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;

      extensions = with pkgs; [
        pkgs.gh-dash
      ];
    };
  };
}
