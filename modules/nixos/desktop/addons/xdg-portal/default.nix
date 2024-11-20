{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.desktop.addons.xdg-portal;
in
{
  options.${namespace}.desktop.addons.xdg-portal = with types; {
    enable = mkBoolOpt false "Whether or not to add support for xdg portal.";
  };

  config = mkIf cfg.enable {
  xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
        config = {
          common.default = ["gtk"];
          hyprland.default = ["gtk" "hyprland"];
          };

          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
	    pkgs.xdg-desktop-portal-hyprland
            ];
      };
    };
  }
