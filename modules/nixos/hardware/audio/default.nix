{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.hardware.audio;
in
{
  options.${namespace}.hardware.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable audio support.";
    mpris-proxy.enable = mkBoolOpt false "Whether or not to enable mpris proxy.";
    alsa-monitor = mkOpt attrs { } "Alsa configuration.";
    nodes = mkOpt (listOf attrs) [ ]
      "Audio nodes to pass to Pipewire as `context.objects`.";
    modules = mkOpt (listOf attrs) [ ]
      "Audio modules to pass to Pipewire as `context.modules`.";
    extra-packages = mkOpt (listOf package) [
      pkgs.qjackctl
      pkgs.easyeffects
    ] "Additional packages to install.";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    hardware.pulseaudio.enable = mkForce false;

    environment.systemPackages = with pkgs; [
      pulsemixer
      pavucontrol
    ] ++ cfg.extra-packages;

    t0psh31f.user.extraGroups = [ "audio" ];

    # t0psh31f.home.extraOptions = {
    #   systemd.user.services.mpris-proxy = lib.optionalAttrs cfg.mpris-proxy.enable {
    #     Unit.Description = "Mpris proxy";
    #     Unit.After = [ "network.target" "sound.target" ];
    #     Service.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    #     Install.WantedBy = [ "default.target" ];
    #   };
    # };
  };
}
