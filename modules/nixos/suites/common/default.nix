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
    # (callPackage pkgs.sddm-lain-wired-theme
      adbfs-rootless
      adl
      ark
      aria2
      appimage-run
      ags
      alacritty
      anyrun
      apfsprogs
      armcord
      autofs5
      autopsy
      bindfs
      bitmagnet
      bluez
      bluez-alsa
      bluez-tools
      blueman
      bluetuith
      blueberry
      bottom
      breeze-hacked-cursor-theme
      btrfs-assistant
      btrfs-snap
      btrfs-progs
      btop
      calibre
      calibre-web
      cargo
      caprine-bin
      cifs-utils
      commonsCompress
      curl
      curlftpfs
      czkawka
      davfs2
      ddrescue
      dosfstools
      e2fsprogs
      etherape
      ettercap
      extundelete
      feh
      figlet
      foremost
      fsarchiver
      fsautocomplete
      fuzzel
      gedit
      gitfs
      gifsicle
      nautilus
      gpt4all
      gparted
      gzip
      headscale
      hfsprogs
      htop
      # hyper
      imagemagick
      inputs.lobster.packages."x86_64-linux".lobster
      imv
      kate
      kodi-wayland
      krabby
      lf
      lolcat
      nextcloud-client
      nextcloud29
      newsboat
      nh
      nil
      nix-output-monitor
      nixd
      nixel
      nixfmt-rfc-style
      nixos-bgrt-plymouth
      ntfs3g
      nvd
      magicrescue
      mate.caja
    # mate.caja-extensions
      mate.caja-with-extensions
      miru
      mtpfs
      mpd
      mpv
      myrescue
      obexfs
      openafs
      openai-whisper-cpp
      overskride
      peazip
      popcorntime
      retrofe
      retroarchFull
      rio
      rofi-wayland
      rofi-bluetooth
      rofi-menugen
      rustup
      sassc
      sbctl
      simple-mtpfs
      sirikali
      solaar
      socat
      sshfs
      statix
      spotify
      spaceFM
      swww
      synapse
      t0psh31f.list-iommu
      tailscale
      tangram
      telegram-desktop
      testdisk
      toilet
      tor
      tor-browser
      tree
      patch
      persepolis
      pokeget-rs
      pokemonsay
      powertop
      inputs.pyprland.packages."x86_64-linux".pyprland
      ueberzugpp
      udisks
      usbimager
      xarchiver
      xplorer
      warp-terminal
      waybar
      wezterm
      wirelesstools
      winetricks
      wofi
      whois
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
        remote-desktop = enabled;
        tailscale = enabled;
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
