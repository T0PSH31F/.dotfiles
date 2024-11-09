{  lib, namespace, ... }:

with lib;
with lib.${namespace};
{
  imports = [ ./hardware-configuration.nix ];

 # boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  t0psh31f = {
    archetypes = {
      workstation = enabled;
      gaming = enabled;
    };

    apps = { qbittorrent = enabled; };

    desktop = {
      hyprland = enabled;
    };

    hardware = {};

    security = { gpg = mkForce disabled; };

    services = {
      home-assistant = enabled;
      mealie = enabled;
      printing = lib.mkForce disabled;
    };


    suites = {
    #  desktop = enabled;
    #  development = enabled;
    #  yahrr = enabled;
    };

    system = {

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
