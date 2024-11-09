{
  config,
  lib,
  inputs,
  pkgs,
  namespace,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.desktop.hyprland;
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
      plugins = [
        # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
        # inputs.hyprland-plugins.packages.${pkgs.system}.borders-plus-plus
      ];
    };
  };
}
