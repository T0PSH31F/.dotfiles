{ config, lib, pkgs, inputs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.common;
in
{
  options.${namespace}.suites.common = with types; {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      appimage-run
      aichat
      aircrack-ng
      armcord
      bluez
      bluez-alsa
      bluez-tools
      bluetuith
      bottom # sys monitor
      btop
      caprine-bin
      fuzzel
      gedit
      gpt4all
      htop
      inputs.lobster.packages."x86_64-linux".lobster
      kate
      lexido
      nextcloud-client
      nextcloud29
      newsboat
      mods
      openai-whisper-cpp
      sbctl
      skypilot
      spotify
      synapse
      t0psh31f.list-iommu
      trackma
      tangram
      tor
      tor-browser
      patch
      pinokio
      powertop
      inputs.pyprland.packages."x86_64-linux".pyprland
      vivaldi
    ];

networking.networkmanager.enable = true;

hardware = {
  bluetooth = {
    enable = true;
    powerOnBoot = true;
    package = pkgs.bluez;
  };
};

services = {
  blueman.enable = true;
  devmon.enable = true;
  gvfs.enable = true;
  udisks2.enable = true;
#  displayManager.sddm = {
#   theme = sddm-lain-wired-theme;
#    wayland.enable = true;
#  };
};

    t0psh31f = {
      nix = enabled;

      programs = {
          terminal = {
          tools = {
            nh = enabled;
            bandwhich = enabled;
            flake = enabled;
            nix-ld = enabled;
          };
        };
      };

      hardware = {
        audio = enabled;
        sensors = enabled;
        storage = enabled;
      };

      security = {
        doas = disabled;
        gpg = disabled;
        keyring.enable = config.${namespace}.desktop.gnome.enable;
      };

      services = {
        avahi = enabled;
        openssh = enabled;
        printing = enabled;
        remote-desktop = disabled;
        tailscale = disabled;
      };

      system = {
        boot = enabled;
        fonts = enabled;
        locale = enabled;
        networking = enabled;
        time = enabled;
        xkb = enabled;
      };
    };
  };
}
