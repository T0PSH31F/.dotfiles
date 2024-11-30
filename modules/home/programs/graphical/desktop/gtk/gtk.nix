{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.gtk;
in
{
  options.${namespace}.programs.graphical.desktop.addons.gtk = with types; {
    enable = mkBoolOpt true "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
  home.pointerCursor = {
    package = pkgs.afterglow-cursors-recolored;
    name = "dracula-teddy";
    size = 36;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "gruvbox-plus-icons";
      package = pkgs.gruvbox-plus-icons;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;
}
