{ lib, modulesPath, inputs, pkgs, ... }:

let inherit (inputs) nixos-hardware;
in {
  imports = with nixos-hardware.nixosModules; [
    (modulesPath + "/installer/scan/not-detected.nix")
    common-cpu-amd
    common-cpu-amd-pstate
    common-gpu-amd
    common-pc
    common-pc-laptop
    common-pc-laptop-acpi_call
    common-pc-ssd
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    binfmt.emulatedSystems = [ "aarch64-linux" ];
    initrd = {
      availableKernelModules =
        [ "xhci_pci" "thunderbolt" "nvme" "uas" "usb_storage" "sd_mod" ];
      luks.devices."crypted".device =
        "/dev/disk/by-uuid/2740b97b-a34c-43d5-9a5b-bb86521690ca";
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
    "/home" = {
      device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;

  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };

  hardware.sensor.iio.enable = true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  powerManagement.powertop.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
