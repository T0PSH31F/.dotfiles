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
        gh-dash
        gh-markdown-preview
        ghdorker
        github-desktop
        git-hound
        nix-prefetch-github
        octosuite
      ];
    };
  };
}
