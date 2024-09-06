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
      adbtuifm
      archiver
      ark
      commonsCompress
      ffmpegthumbnailer
      fff
      fsautocomplete
      fsarchiver
      gzip
      lf
      noice
      mount-zip
      hifile
      ranger
      renameutils
      patool
      peazip
      pistol # General purpose file previewer designed for Ranger, Lf to make scope.sh redundant
      sshfs
      spaceFM
      superfile
      tree
      unzip
      unar
      xarchiver
      xplorer
      zip

    # Backups and synchronization
      syncthing
      syncthingtray

    # Disc tools
      czkawka
      duf # disk usage/free utility
      duc # disk usage visualizier
      dua # disk usage of directories
      fclones-gui # Interactive duplicate file remover
      jdupes # dupe file finder
      rmlint # removes dupes and other lint from fs
      gparted
      udisks
      usbimager

    # Recovery
      testdisk
      autopsy
      sleuthkit
      ddrescue
      safecopy
      myrescue
      lsirec
      acquire
      dc3dd
      foremost
      magicrescue
      ext4magic
      extundelete

    # BTRFS utils
      snapper-gui
      buttermanager
      btrbk
      btdu
      btrfs-auto-snapshot
      btrfs-progs
      btrfs-snap
      btrfs-assistant

    # NTFS
      nfs-utils
      ntfs3g
      fuseiso
      pinfo
      nsplist
      libdwg
      rar2fs
      nar-serve
      file-roller
      exiftags
      diffuse # Graphical tool for merging and comparing text files
      obexfs
      openafs
      apfs-fuse
      hfsprogs
      darling-dmg
      metadata-cleaner
      gitfs
      jmtpfs
      e2fsprogs
      adbfs-rootless
      libimobiledevice
      simple-mtpfs
      go-mtpfs
      ifuse
      ];

    hardware.flipperzero.enable = true;

  # services.autofs.enable = true;

    services.envfs.enable = true;

    services.fstrim.enable = lib.mkDefault cfg.ssdEnable;
  };
}
