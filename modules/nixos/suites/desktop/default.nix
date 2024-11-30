{ config, lib, pkgs, namespace, inputs, system, ... }:

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

  # SDDM - Display Manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
  #  theme = "chili";
  #  package = pkgs.sddm;
    };

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
      inputs.walker.packages.${pkgs.system}.default
      filelight
    ];

      qt = {
        enable = true;
        platformTheme = "gtk2";
        style = "gtk2";
        };

    t0psh31f = {
      desktop = {
		stylix = enabled;

        addons = {
          electron-support = enabled;
          gtk-qt = enabled;
          nautilus = enabled;
          keyring = enabled;
          term = enabled;
          xdg-portal = enabled;
        };

        des = {
    	   #  gnome = enabled;
     	   hyprland = enabled;
   	     #  wayfire = enabled;
         };
      };
    };
  };
}
