{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.hardware.storage;
in {
  options.${namespace}.hardware.storage = with types; {
    enable = mkBoolOpt false
      "Whether or not to enable support for extra storage devices.";
    ssdEnable = mkBoolOpt true
      "Whether or not to enable support for SSD storage devices.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
    # FIle Managers
      archiver
      ark
      commonsCompress
      ffmpeg
      ffmpegthumbnailer
      fff
      gzip
      keepassxc
      keeweb
      lf
      noice
      ranger
      patool
      peazip
      pistol # General purpose file previewer designed Ranger, Lf to make scope.sh redundant
      sshfs
      tree
      unzip
      unar
      xarchiver
      zip

    # Backups and synchronization
      syncthing
      syncthingtray

    # Disc tools
      duf # disk usage/free utility
      duc # disk usage visualizier
      dua # disk usage of directories
      fclones-gui # Interactive duplicate file remover
      rmlint # removes dupes and other lint from fs
      gparted
      udisks
      usbimager

    # Recovery
      testdisk
      autopsy
      sleuthkit

    # BTRFS utils
      btrbk
      btdu
      btrfs-progs
      btrfs-assistant

    # ADB
      adbtuifm
      diffuse # Graphical tool for merging and comparing text files
      metadata-cleaner
      adbfs-rootless
      libimobiledevice
  #   simple-mtpfs
      go-mtpfs
  #   ifuse
      ];

    zramSwap = {
      enable = true;
      algorithm = "zstd";
    };

    programs = {
      usbtop.enable = true;
      adb.enable = true;
      };

    hardware = {
        flipperzero.enable = true;
        sensor.iio.enable = true;
        xpadneo.enable = true;
    };

    services = {
      irqbalance.enable = true;
      fstrim.enable = lib.mkDefault cfg.ssdEnable;
    };
  };
}
