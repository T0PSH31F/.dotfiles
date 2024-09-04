{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.desktop.hyprland;
in {
  options.${namespace}.desktop.hyprland = with types; {
    enable = mkBoolOpt false "Whether or not to use Hyprland as the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment = {
      sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
      systemPackages = with pkgs; [
        anyrun
        brightnessctl
        networkmanagerapplet
        playerctl
        waybar
      ];
    };

    programs.hyprland.enable = true;

    services.xserver.displayManager.gdm = {
      enable = false;
      wayland = true;
    };


  #  services.displayManager.sddm.wayland.enable = true;

  #  services.polkit-gnome = enabled;
  };
}
