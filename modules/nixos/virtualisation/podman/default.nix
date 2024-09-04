{ config, lib, pkgs, namespace, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.virtualisation.podman;
in
{
  options.${namespace}.virtualisation.podman = {
    enable = mkBoolOpt false "Whether or not to enable Podman.";
  };

  config = mkIf cfg.enable {
    # NixOS 22.05 moved NixOS Containers to a new state directory and the old
    # directory is taken over by OCI Containers (eg. podman). For systems with
    # system.stateVersion < 22.05, it is not possible to have both enabled.
    # This option disables NixOS Containers, leaving OCI Containers available.
    boot.enableContainers = false;

    environment.systemPackages = with pkgs; [
      podman-compose
      podman-desktop
    ];

    t0psh31f = {
      user = {
        extraGroups = [
          "docker"
          "podman"
        ];
      };

      home.extraOptions = {
        home.shellAliases = {
          "docker-compose" = "podman-compose";
        };
      };
    };

  virtualisation = {


      # Registries to search for images on `podman pull`
      containers.registries.search = [
        "docker.io"
        "quay.io"
        "ghcr.io"
        "gcr.io"
      ];

      podman = {
    inherit (cfg) enable;


        # Make Podman backwards compatible with Docker socket interface.
        # Certain interface elements will be different, but unless any
        # of said values are hardcoded, it should not pose a problem
        # for us.
        dockerCompat = true;
        dockerSocket.enable = true;

        defaultNetwork.settings.dns_enabled = true;

        # Enable Nvidia support for Podman if the Nvidia drivers are found
        # in the list of xserver.videoDrivers.
        # enableNvidia = builtins.any (driver: driver == "nvidia") config.services.xserver.videoDrivers;

        # Prune images and containers periodically
        autoPrune = {
          enable = true;
          flags = ["--all"];
          dates = "weekly";
        };
      };
    };
  };
}

