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
        (hiPrio t0psh31f.xdg-open-with-portal)
        ags
        anyrun
        brightnessctl
        grim
        networkmanagerapplet
        overskride
        playerctl
        sirikali
        slurp
        sway
        waybar
        wlsunset
        wl-clipboard
      # Virtual keyboard
        maliit-framework
        maliit-keyboard
  ];};
      services.greetd = {
      package = pkgs.greetd;
      enable = true;
      settings = rec {
        initial_session = {
          command = let
            flags = lib.cli.toGNUCommandLineShell {} {
              t = "";
              window-padding = 1;
              g = "Hello, T0PSH31F";
              c = "Hyprland";
            };
          in "${pkgs.greetd.tuigreet}/bin/tuigreet ${flags}";
          user = "t0psh31f";
        };
        default_session = initial_session;
      };
    };
    systemd = {
      user.services.polkit-gnome = {
        description = "polkit-gnome-authentication-agent-1";
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

#services.xserver = {
#  displayManager = {
#    gdm = {
#      enable = true;
#      wayland = true;};
#    };
#    libinput.enable = true;
#    };
    programs.hyprland.enable = true;
    programs = {
      dconf.enable = true;
      hyprlock.enable = true;
      file-roller.enable = true;
      kdeconnect.enable = true;
    };

    };
  }
