{ config, lib, pkgs, namespace, ... }:

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

  services.greetd = {
      enable = true;
      restart = true;
      package = pkgs.greetd.tuigreet;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --time --time-format '%Y-%m-%d %H:%M:%S' --cmd sway";
          user = "t0psh31f";
        };
      };
    };

  #  services.xserver = {
  #      enable = true;
  #    displayManager.sddm = {
  #                  enable = true;
  #          wayland.enable = true; # Enable SDDM for Wayland
  #      };
  #  };
    services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.walker.packages.x86_64-linux.default
      filelight
      gparted
    ];

    t0psh31f = {
      desktop = {
        addons = {
            rofi = enabled;
        };
        gnome = disabled;
        plasma = {
          enable = false;
          config.enable = false;
          panels.enable = false;
          shortcuts.enable = false;
        };
        hyprland = enabled;
        stylix = enabled;
      #  addons = { wallpapers = enabled; };
      };
    };
  };
}
