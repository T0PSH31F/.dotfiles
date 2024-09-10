{ lib, config, inputs, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.apps.walker;
in
{
  imports = [inputs.walker.homeManagerModules.default];

  options.${namespace}.programs.graphical.apps.walker = {
    enable = mkBoolOpt false "Whether or not to enable walker";
  };

  config = mkIf cfg.enable {
  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      ignore_mouse = true;
      websearch.prefix = "?";
      switcher.prefix = "/";
    };

    theme = {
      layout = {
        ui.window.box = {
          v_align = "center";
          orientation = "vertical";
        };
      };

      style = ''
        child {
          border-radius: 20;
        }
      '';
    };
  };
};
}