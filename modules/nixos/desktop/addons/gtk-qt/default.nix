{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.addons.gtk-qt;
  #gdmCfg = config.services.xserver.displayManager.gdm;
in
{
  options.${namespace}.desktop.addons.gtk-qt = with types; {
    enable = mkBoolOpt true "Whether to customize GTK and apply themes.";
    theme = {
    # name = mkOpt str (lib.mkForce "gruvbox-gtk-theme") "The name of the GTK theme to apply.";
    # pkg = mkOpt package pkgs.gruvbox-gtk-theme "The package to use for the theme.";
    };
    cursor = {
      name = mkOpt str "dracula-green" "The name of the cursor theme to apply.";
      pkg = mkOpt package pkgs.afterglow-cursors-recolored "The package to use for the cursor theme.";
    };
    icon = {
      name = mkOpt str "gruvbox-plus-icons" "The name of the icon theme to apply.";
      pkg = mkOpt package pkgs.gruvbox-plus-icons "The package to use for the icon theme.";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.icon.pkg
      cfg.cursor.pkg
    #  libsForQt5.qtwayland
      ];

    environment.sessionVariables = {
      XCURSOR_THEME = cfg.cursor.name;
    };

    t0psh31f.home.extraOptions = {
      gtk = {
        enable = true;

        theme = {
        #  name = cfg.theme.name;
        #  package = cfg.theme.pkg;
        #  gtk-theme = "${cfg.theme.name}";
        };

        cursorTheme = {
          name = cfg.cursor.name;
          package = cfg.cursor.pkg;
        };

        iconTheme = {
          name = cfg.icon.name;
          package = cfg.icon.pkg;
        };
      };
    };

  # Theme QT -> GTK
  #  qt = {
  #    enable = true;
  #    platformTheme.name = "gtk";
  #    style = {
  #      name = "adwaita-dark";
  #      package = pkgs.adwaita-qt;
  #    };
  #  };
  };
}
