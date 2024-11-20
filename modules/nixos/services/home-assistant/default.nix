{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.home-assistant;
in
{
  options.${namespace}.services.home-assistant = with types; {
    enable = mkBoolOpt false "Whether or not to enable home-assistant.";
    serialPort = mkOpt str "/dev/ttyACM0" "The serial port to use.";
  };

  config = mkIf cfg.enable {

    t0psh31f.user.extraGroups = [ "hass" ];

    services.mosquitto = {
      enable = true;
      listeners = [{
        acl = [ "pattern readwrite #" ];
        omitPasswordAuth = true;
        settings.allow_anonymous = true;
      }];
    };

    services.zigbee2mqtt = {
      enable = true;
      settings = {
        homeassistant = config.services.home-assistant.enable;
        permit_join = false;
        mqtt = {
          server = "mqtt://127.0.0.1:1883";
          base_topic = "zigbee2mqtt";
        };
        frontend = {
          port = 8090;
        };
        serial = {
          port = "/dev/ttyACM1";
          adapter = "deconz";
        };
        advanced = { log_level = "debug"; };
      };
    };

    services.home-assistant = {
      enable = true;
      extraComponents = [
        "radarr"
        "sonarr"
        "backup"
        "cast"
        "esphome"
        "ibeacon"
        "forked_daapd"
        "freebox"
        "google_translate"
        "ipp"
        "local_calendar"
        "ld2410_ble"
        "met"
        "mobile_app"
        "mqtt"
        "netatmo"
        "radio_browser"
        "roborock"
        "samsungtv"
        "tailscale"
        "telegram"
        "tuya"
        "wled"
        "yeelight"
        "zeroconf"
        "zha"
      ];

      extraPackages = ps: with ps; [
        pychromecast
      ];

    #  customComponents = with pkgs.home-assistant-custom-components; [
    #    adaptive_lighting
    #  ];

      customLovelaceModules = with pkgs.home-assistant-custom-lovelace-modules; [
        button-card
        card-mod
        mini-graph-card
        mini-media-player
        multiple-entity-row
        mushroom
        pkgs.t0psh31f.lovelace-auto-entities
        pkgs.t0psh31f.lovelace-fold-entity-row
        pkgs.t0psh31f.lovelace-layout-card
        pkgs.t0psh31f.bubble-card
      ];

      config = {
        # Includes dependencies for a basic setup
        # https://www.home-assistant.io/integrations/default_config/
        default_config = { };
        lovelace.mode = "yaml";
        lovelace.resources = [
          {
            url = "/local/nixos-lovelace-modules/mushroom.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/bubble-card.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/layout-card.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/card-mod.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/button-card.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/fold-entity-row.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/auto-entities.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/mini-graph-card-bundle.js";
            type = "module";
          }
          {
            url = "/local/nixos-lovelace-modules/mini-media-player-bundle.js";
            type = "module";
          }
        ];

        "automation manual" = [ ];
        "automation ui" = "!include automations.yaml";
        "scene ui" = "!include scenes.yaml";
        "script ui" = "!include scripts.yaml";

        sensor = {
          platform = "time_date";
          display_options = [
            "time"
            "date"
            "date_time"
            "date_time_utc"
            "date_time_iso"
            "time_date"
            "time_utc"
          ];
        };
      };
    };

    networking.firewall = {
      allowedTCPPorts = [ 80 443 8123 ];
    };
  };
}
