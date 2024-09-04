{
  config,
  namespace,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.lf;
in {
  options.${namespace}.programs.terminal.tools.lf = {
    enable = mkBoolOpt false "Enable lf terminal file manager";
  };

  config = mkIf cfg.enable {
    programs.lf = {
      enable = true;
      commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
        editor-open = ''$$EDITOR $f'';
        mkdir = ''
          ''${{
              printf "Directory name: "
              read DIR
              mkdir $DIR
          }}
        '';
      };
      keybindings = {
        "\\\"" = "";
        o = "";
        c = "mkdir";
        "." = "set hidden!";
        "`" = "mark-load";
        "\\'" = "mark-load";
        "<enter>" = "open";
        "-" = "updir";

        do = "dragon-out";

        "g~" = "cd";
        gh = "cd";
        "g/" = "/";

        ee = "editor-open";
        v = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';
      };
    };
  };
}
