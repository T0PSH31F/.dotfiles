{ lib, config, pkgs, namespace, ... }:

let
  inherit (lib) getExe mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.zellij;
in
{
  options.${namespace}.programs.terminal.tools.zellij = {
    enable = mkBoolOpt false "Whether or not to enable zellij.";
  };

  config = mkIf cfg.enable {
    programs.zellij = {
      enable = true;
      package = pkgs.zellij;

      settings = {
        auto_layouts = true;
        default_layout = "compact";

        ui.pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };

        # load internal plugins from built-in paths
        plugins = {
          tab-bar.path = "tab-bar";
          status-bar.path = "status-bar";
          strider.path = "strider";
          compact-bar.path = "compact-bar";
        };
      };
    };

    programs.fish.interactiveShellInit = ''
      if not test -n "$INSIDE_EMACS"
        eval (${getExe config.programs.zellij.package} setup --generate-auto-start fish | string collect)
      end
    '';

    home.file.".config/zellij" = {
      source = ./config;
      recursive = true;
    };
  };
}
