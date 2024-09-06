{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.emulators.wezterm;
in
{
  options.${namespace}.programs.terminal.emulators.wezterm = with types; {
    enable = mkBoolOpt false "Whether or not to enable wezterm.";
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      package = pkgs.wezterm;
      extraConfig = builtins.readFile ./config.lua;
    };
  };
}
