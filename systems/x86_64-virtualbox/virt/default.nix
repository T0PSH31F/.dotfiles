{ lib, namespace, ... }:

with lib;
with lib.${namespace};
{
  virtualisation.virtualbox.guest.enable = true;

  boot.loader.grub.enable = true;

  t0psh31f = {
    nix = enabled;

    apps = {
      firefox = enabled;
    };

    desktop = {
      gnome = {
        enable = true;
      };

      addons = {
        # I like to have a convenient place to share wallpapers from
        # even if they're not currently being used.
        wallpapers = enabled;
      };
    };

    tools = {
      git = enabled;
      misc = enabled;
      lang = {
        nix = enabled;
        node = enabled;
      };
    };

    hardware = {
      audio = enabled;
      networking = enabled;
    };

    services = { printing = enabled; };

    security = {
      doas = disabled;
      keyring = enabled;
    };

    system = {
      fonts = enabled;
      locale = enabled;
      time = enabled;
      xkb = enabled;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
