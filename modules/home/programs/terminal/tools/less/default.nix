{ config, lib, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.less;
in
{
  options.${namespace}.programs.terminal.tools.less = {
    enable = mkBoolOpt false "Whether or not to enable less.";
  };

  config = mkIf cfg.enable {
    programs.less = {
      enable = true;
      keys = ''
        c   next-tag
        C   prev-tag
        t   forw-line
        s   back-line
        T   forw-scroll
        S   back-scroll
      '';
    };
  };
}
