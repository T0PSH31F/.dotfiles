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
      aircrack-ng
      arduino
      arduinoOTA
      arduino-ide
      bluez
      bluez-alsa
      bluez-tools
      bluetuith
      bottom # sys monitor
      btop
      bun
      caprine-bin
      esbuild
      exportarr
      fd
      fuzzel
      gedit
      glib
      gnome-disk-utility
      gnome-bluetooth
      gobject-introspection
      grimblast
      gpu-screen-recorder
      htop
      hyprpanel
      inputs.lobster.packages."x86_64-linux".lobster
      kate
      libnotify
      legcord
      libgtop
      newsboat
      nmon
      matugen
      sbctl
      synapse
      sublime3
      t0psh31f.list-iommu
      trackma
      tangram
      texstudio
      themechanger
      tor
      tor-browser
      typescript
      patch
      powertop
      pywal
      python3
      python312Packages.finvizfinance
      vimPlugins.avante-nvim
      vivaldi
      usermount
      wallust
      wpgtk
    ];

programs.partition-manager.enable = true;
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
        yubikey = enabled;
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
