{ lib, config, inputs, namespace, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.apps.nyaa;
in
{
  imports = [inputs.nyaa.homeManagerModule];

  options.${namespace}.programs.graphical.apps.nyaa = {
    enable = mkBoolOpt false "Whether or not to enable nyaa";
  };

  config = mkIf cfg.enable {
  programs.nyaa = {
    enable = true;

    # Nyaa or TorrentGalaxy, depends on what I watch more of
    default_source = "Nyaa";
    download_client = "DefaultApp";
    date_format = "%Y-%m-%d";
    hot_reload_config = false;

    notifications.position = "BottomLeft";
    clipboard.cmd = "wl-copy";

    client.default_app.use_magnet = true;
    source = {
      nyaa = {
        default_sort = "Downloads";
        default_filter = "TrustedOnly";
        default_category = "AnimeEnglishTranslated";
      };

      torrentgalaxy = {
        default_sort = "Seeders";
        default_filter = "ExcludeXXX";
      };
    };
  };
};
}