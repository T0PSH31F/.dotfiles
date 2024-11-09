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
        hyprpanel
        hyprland-protocols
        networkmanagerapplet
        overskride
        playerctl
        sirikali
        slurp
        sway
        wlsunset
        wl-clipboard
        varia
  ];};

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

  #  services.displayManager.sddm = {
  #    enable = true;
  #    wayland.enable = true;
  #    enableHidpi = true;
  #    package = pkgs.sddm;
  #  };

    services = {
      dbus = {
        enable = true;
        packages = with pkgs; [
          dconf
          gcr
          gnome-settings-daemon
          ];
      };

      gnome.gnome-keyring.enable = true;

      gvfs.enable = true;
    };

    programs.hyprland = {
      enable = true;
     # package = inputs.hyprland.packages."x86-64_linux".default;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    programs = {
      dconf.enable = true;
      hyprlock.enable = true;
      iio-hyprland.enable = true;
      file-roller.enable = true;
      kdeconnect.enable = true;
      uwsm = {
        enable = true;
        waylandCompositors = {
          hyprland = {
            prettyName = "Hyprland";
            comment = "Hyprland compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/Hyprland";
          };
        };
      };
      waybar.enable = true;
    };

    };
  }
