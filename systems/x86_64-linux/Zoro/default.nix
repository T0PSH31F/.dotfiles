{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
{
  imports = [ ./hardware.nix ];

 # boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  # disable sleep
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  t0psh31f = {
    archetypes = {
      workstation = enabled;
    };

    apps = { qbittorrent = enabled; };


    security.gpg = mkForce disabled;

    services = {
      home-assistant = enabled;
      mealie = enabled;
      printing = lib.mkForce disabled;
    };

    suites = {
      desktop = enabled;
      yahrr = enabled;
    };

    system = {
      boot = enabled;
      };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Can't touch this 🔨
}
