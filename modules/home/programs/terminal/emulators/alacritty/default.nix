{ config, lib, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.emulators.alacritty;
in
{
  options.${namespace}.programs.terminal.emulators.alacritty = {
    enable = mkBoolOpt false "Whether or not to enable alacritty.";
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;

    settings = {
      window = {
      decorations = "none";
      padding = { x = 8; y = 8; };
      dynamic_padding = true;
      startup_mode = "Maximized";
        };
      };
    };
  };
}
