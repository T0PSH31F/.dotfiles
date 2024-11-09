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
    programs = {
    usbtop.enable = true;
    adb.enable = true;
    };

  # greetd display manager
    services.greetd = let
      session = {
        command = "${lib.getExe config.programs.hyprland.package}";
        user = "t0psh31f";
      };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;

  environment.systemPackages = with pkgs; [
      inputs.walker.packages.${pkgs.system}.default
      filelight
      gparted
    ];

      qt = {
        enable = true;
        platformTheme = "gtk2";
        style = "gtk2";
        };

    t0psh31f = {
      desktop = {
        addons = {
          electron-support = enabled;
        # gtk-qt = enabled;
          nautilus = enabled;
          keyring = enabled;
          term = enabled;
          xdg-portal = enabled;
        };
      #  gnome = enabled;
        hyprland = enabled;
        stylix = enabled;
      #  wayfire = enabled;
      };
    };
  };
}
