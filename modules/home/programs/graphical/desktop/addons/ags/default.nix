{ inputs, options, pkgs, lib, config, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.ags;
in
{
   options.${namespace}.programs.graphical.desktop.addons.ags = with types; {
    enable = mkBoolOpt false "Whether to enable ags in the desktop environment.";
  };

  config = mkIf cfg.enable {
  programs.ags = {
    enable = true;

    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      accountsservice

    ];
  };

 # home.file =
 #   let wal = config.wal.enable; in
 #   lib.mkMerge [
 #     {
 #       ".config/ags/config.js".source = ./config/config.js;
 #       ".config/ags/wallpapers.js".source = ./config/wallpapers.js;
 #       ".config/ags/style.css".source = ./config/style.css;
 #       ".config/ags/cpu.sh".source = ./config/cpu.sh;
 ##       ".config/ags/mem.sh".source = ./config/mem.sh;
 ## #      ".config/ags/colors_default.css".source = ./config/colors_default.css;
 #     }
 #     (if wal then {
 #       ".config/wpg/templates/ags.css.base".source = ./config/colors_wal.css;
 #       ".config/ags/colors.css".source =
 #         config.lib.file.mkOutOfStoreSymlink
 #         "/home/zeroth/.config/wpg/templates/ags.css";
 #     }
 #     else {
 #       ".config/hypr/colors.css".source = ./config/colors_default.css;
 #     })
 #   ];
  };
}
