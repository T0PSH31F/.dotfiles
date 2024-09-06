{ config, lib, pkgs, namespace, inputs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.desktop;
in
{
  options.${namespace}.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    programs = {
    usbtop.enable = true;
    adb.enable = true;
    };


    environment.systemPackages = with pkgs; [
      inputs.walker.packages.${pkgs.system}.default
      filelight
      gparted
    ];

    t0psh31f = {
      desktop = {
        addons = {
            rofi = enabled;
            wofi = enabled;
            waybar = enabled;
        };
        gnome = disabled;
        hyprland = enabled;
        stylix = enabled;
      };
    };
  };
}
