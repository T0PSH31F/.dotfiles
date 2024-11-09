{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.wofi;
in
{
  options.${namespace}.programs.graphical.desktop.addons.wofi = with types; {
    enable = mkBoolOpt false "Whether to enable the Wofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wofi
      wofi-pass
      bemoji
      onagre
      ];

    programs.wofi = {
      enable = true;
      settings = {
        location = "center";
        allow_markup = false;
        mode = "drun";
        width = 500;
    };

  # style = with config.lib.stylix.colors; ''
  # '';


#       * {
#        font-family: "JetBrainsMono";
#        font-size: 13;
#      }
#
#      /*--the entire wofi window--*/
#
#      window {
#        margin: 10px;
#        border: 3px solid #''+base00+'';
#        background-color: #''+base05+'';
#      }
#
#      /*--from outermost to innermost*--/
#
#      #outer-box {
#        margin: 5px;
#      }
#
#      #input {
#        margin: 5px;
#      }
#
#      #scroll {
#        margin: 5px;
#      }
#
#      #inner-box {
#        padding: 5px;
#      }
#
#      #entry:selected {
#        background-color: #''+base0C+'';
#        padding: 5px;
#      }
#
#      #text {
#        padding: 5px;
#      }
#

    # config -> .config/wofi/config
    # css -> .config/wofi/style.css
    # colors -> $XDG_CACHE_HOME/wal/colors
  #  t0psh31f.home.configFile."wofi/config".source = ./config;
  #  t0psh31f.home.configFile."wofi/style.css".source = ./style.css;
    };
  };
}

