{ options, config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.rofi;
in
{
  options.${namespace}.programs.graphical.desktop.addons.rofi = with types; {
    enable = mkBoolOpt false "Whether to enable Rofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    rofi-wayland
    rofi-bluetooth
    rofi-menugen
      ];

    xdg.configFile."rofi/config.rasi".source = ./config.rasi;
  };
}
