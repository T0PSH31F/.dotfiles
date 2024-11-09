{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.locale;
in
{
  options.${namespace}.system.locale = with types; {
    enable = mkBoolOpt false "Whether or not to manage locale settings.";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_MONETARY = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
    };

  location.provider = "geoclue2";

  # provide location
  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://beacondb.net/v1/geolocate";
    submissionUrl = "https://beacondb.net/v2/geosubmit";
    submissionNick = "geoclue";

    appConfig.gammastep = {
      isAllowed = true;
      isSystem = false;
      };
    };
  };
}
