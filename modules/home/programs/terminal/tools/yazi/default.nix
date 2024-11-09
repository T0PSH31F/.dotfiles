{
  lib,
  namespace,
  config,
  pkgs,
  inputs,
  ...
}:
with lib;
with lib.${namespace};
let
    filetype = import ./filetype.nix;
    icons = import ./icons.nix;
    manager = import ./manager.nix;
    status = import ./status.nix;
    cfg = config.${namespace}.programs.terminal.tools.yazi;
in
{

  imports = [
   # ./filetype.nix
   # ./icons.nix
   # ./manager.nix
   # ./status.nix
      ];

  options.${namespace}.programs.terminal.tools.yazi = with types; {
    enable = mkBoolOpt false "Whether or not to enable yazi.";
  };

  config = mkIf cfg.enable {

  # general file info
  home.packages = [pkgs.exiftool];

  # yazi file manager
  programs.yazi = {
    enable = true;

    # package = inputs.yazi.packages.${pkgs.system}.default;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        layout = [1 4 3];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };

      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = config.xdg.cacheHome;
      };
    };
  };
};
}
