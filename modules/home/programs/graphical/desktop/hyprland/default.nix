{
  config,
  lib,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.desktop.hyprland;
#  display_switcher = pkgs.writeShellScriptBin "display_switcher" ''
#    #!/bin/sh
#
#    if [[ $(hyprctl monitors) == *"eDP-1"* ]]; then
#      hyprctl keyword monitor "eDP-1, disable"
#    else
#      hyprctl keyword monitor "eDP-1, prefered, auto, auto"
#    fi
#  '';
in
{
  options.${namespace}.programs.graphical.desktop.hyprland = {
    enable = mkBoolOpt false "Whether or not to enable hyprland.";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = import ./config.nix;
      systemd.enable = true;
      xwayland.enable = true;
    };

  };
}
