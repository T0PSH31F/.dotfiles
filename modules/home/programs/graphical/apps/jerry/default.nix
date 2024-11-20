{ lib, config, inputs, pkgs, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.apps.jerry;
in
{
   options.${namespace}.programs.graphical.apps.jerry = {
    enable = mkBoolOpt false "Whether or not to enable jerry";
  };

  config = mkIf cfg.enable {
  home.packages = [ inputs.jerry.packages.x86_64-linux.default ];
   # config = {
   #   player = "mpv";
   #   imagePreviewSupport = true;
   #   infoSupport = true;
   # };

  #  config = {
  #    player_arguments = "--profile=anime";
  #    provider = "yugen";
  #    manga_opener = "swayimg";
  #    score_on_completion = "true";
  #    image_preview = "true";
  #  };
  };
}
