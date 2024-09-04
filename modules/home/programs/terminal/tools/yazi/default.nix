{
  lib,
  namespace,
  config,
  pkgs,
  ...
}:
with lib;
with lib.${namespace};
let
    cfg = config.${namespace}.programs.terminal.tools.yazi;
in
{

  imports = [ ./keymap.nix ];

  options.${namespace}.programs.terminal.tools.yazi = with types; {
    enable = mkBoolOpt false "Whether or not to enable yazi.";
  };

  config = mkIf cfg.enable {

  xdg.configFile."yazi/init.lua".source = ./init.lua;

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    settings = {
      manager = {
        ratio = [1 3 3];
        sort_by = "natural";
        sort_reverse = false;
        sort_dir_first = true;
        show_hidden = true;
        show_symlink = true;
        linemode = "size";
      };
      preview = {
      # cache_dir = "${config.xdg.cacheHome}";
        max_height = 900;
        max_width = 600;
      };
      log.enable = false;
      open.rules = [
      {
        mime = "text/*";
        use = ["edit" "reveal"];
      }
      {
        mime = "image/*";
        use = ["image" "reveal"];
      }
      {
        mime = "video/*";
        use = ["play" "reveal"];
      }
      {
        mime = "application/json";
        use = ["edit" "reveal"];
      }
      {
        mime = "*";
        use = ["edit" "open" "reveal"];
      }
    ];
    opener = {
      text = [
        {
          run = ''hx "$@" '';
          for = "linux";
        }
      ];
      image = [
        {
          run = ''imv "$@" '';
          block = true;
          for = "linux";
        }
      ];
      video = [
        {
          run = ''mpv "$@" '';
          block = true;
          for = "linux";
        }
      ];
      reveal = [
        {
          run = ''${pkgs.exiftool}/bin/exiftool "$1";'';
          block = true;
        }
          ];
        };
      };
    };
  };
}