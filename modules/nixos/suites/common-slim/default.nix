{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.common-slim;
in
{
  options.${namespace}.suites.common-slim = with types; {
    enable = mkBoolOpt false "Whether or not to enable common-slim configuration.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cifs-utils
      pkgs.t0psh31f.list-iommu
      powertop
    ];

    t0psh31f = {
      nix = enabled;

      programs.terminal.tools = {
        flake = enabled;
      };

      hardware = {
        storage = enabled;
      };

      security = {
        doas = disabled;
      };

      services = {
        avahi = enabled;
        openssh = enabled;
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
