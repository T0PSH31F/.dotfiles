{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
{
  imports = [ ./hardware.nix ];

 # boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  t0psh31f = {
    archetypes = {
      workstation = enabled;
      gaming = enabled;
    };

    apps = { qbittorrent = enabled; };

    desktop = {
      plasma = {
        touchScreen = true;
        autoLoginUser = config.${namespace}.user.name;
        config = {
          virtualDesktopsNames = [
            "Mail"
            "Video"
            "Other"
            "Stuff"
            "Yes"
          ];
        };
        panels = {
          topPanel = {
            maxLength = 1600;
            minLength = 1400;
          };
          topPanelBis = {
            maxLength = 2000;
            minLength = 1800;
          };
          leftPanel.launchers = [
            "applications:org.kde.dolphin.desktop"
            "applications:firefox-beta.desktop"
            "applications:kitty.desktop"
            "applications:emacsclient.desktop"
          ];
        };
      };
    };

    hardware = {
    # cpu.amd = enabled;
    # gpu.amd = enabled;
    };

    security = { gpg = mkForce disabled; };

    # services.syncthing = enabled;

    suites = {
      desktop = enabled;
      development = enabled;
    };

    system = {};
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Can't touch this 🔨
}
