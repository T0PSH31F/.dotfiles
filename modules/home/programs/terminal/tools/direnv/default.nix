{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.terminal.tools.direnv;
  fish = config.${namespace}.programs.terminal.shells.fish;
in
{
  options.${namespace}.programs.terminal.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = enabled;
    };

    programs.fish = mkIf fish.enable {
      shellAbbrs = {
        da = "direnv allow";
      };
    };
  };
}
