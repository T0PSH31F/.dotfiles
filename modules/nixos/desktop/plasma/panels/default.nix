{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.plasma.panels;
in
{
  options.${namespace}.desktop.plasma.panels = with types; {
    enable = mkBoolOpt false "Whether or not to configure plasma panels.";
    topPanel = {
      maxLength = mkOpt (number) 1900 "The maximum length of the top panel.";
      minLength = mkOpt (number) 1000 "The minimum length of the top panel.";
    };
    topPanelBis = {
      maxLength = mkOpt (number) 1900 "The maximum length of the top panel.";
      minLength = mkOpt (number) 1000 "The minimum length of the top panel.";
    };
    leftPanel = {
      launchers = mkOpt (listOf str)
        [
          "applications:org.kde.dolphin.desktop"
          "applications:firefox-beta.desktop"
          "applications:kitty.desktop"
          "applications:emacsclient.desktop"
        ] "The launchers to display in the panel.";
    };
  };

  config = mkIf cfg.enable {
    t0psh31f.home.extraOptions = {
      programs.plasma = {
        panels = [
          {
            location = "left";
            floating = true;
            height = 60;
            widgets = [
              {
                systemMonitor = {
                  title = "CPU Usage";
                  displayStyle = "org.kde.ksysguard.linechart";
                  sensors = [
                    {
                      name = "cpu/all/usage";
                      color = "250,179,135"; # Peach
                      label = "CPU Usage";
                    }
                  ];
                  totalSensors = [ "cpu/all/usage" ];
                  textOnlySensors = [ "cpu/all/averageTemperature" "cpu/all/averageFrequency" ];
                };
              }
              {
                systemMonitor = {
                  title = "Memory Usage";
                  displayStyle = "org.kde.ksysguard.linechart";
                  sensors = [
                    {
                      name = "memory/physical/usedPercent";
                      color = "166,227,161"; # Green
                      label = "Memory Usage";
                    }
                  ];
                  totalSensors = [ "memory/physical/usedPercent" ];
                  textOnlySensors = [ "memory/physical/used" "memory/physical/total" ];
                };
              }
              "org.kde.plasma.panelspacer"
              "org.kde.plasma.marginsseparator"
              {
                name = "org.kde.plasma.icontasks";
                config = {
                  General = {
                    launchers = cfg.leftPanel.launchers;
                  };
                };
              }
              "org.kde.plasma.marginsseparator"
              "org.kde.plasma.panelspacer"
              {
                systemTray = {
                  icons = {
                    scaleToFit = false;
                    spacing = "small";
                  };

                  items = {
                    shown = [ "org.kde.plasma.battery" ];
                    hidden = [ ];
                    configs = {
                      battery.showPercentage = true;
                    };
                  };
                };
              }
              "org.kde.plasma.digitalclock"
              "org.kde.plasma.pager"
              {
                name = "org.kde.plasma.kickoff";
                config = {
                  General = {
                    icon = "choice-round";
                    paneSwap = "true";
                  };
                };
              }
            ];
          }
          # Global menu at the top
          {
            alignment = "center";
            floating = true;
            height = 32;
            hiding = "autohide";
            lengthMode = "custom";
            location = "top";
            maxLength = cfg.topPanel.maxLength;
            minLength = cfg.topPanel.minLength;
            screen = 0;
            widgets = [
              "com.github.antroids.application-title-bar"
              "org.kde.plasma.appmenu"
              "org.kde.plasma.panelspacer"
              "org.kde.plasma.digitalclock"
              "org.kde.plasma.panelspacer"
            ];
          }
          {
            alignment = "center";
            floating = true;
            height = 32;
            hiding = "autohide";
            location = "top";
            lengthMode = "custom";
            maxLength = cfg.topPanelBis.maxLength;
            minLength = cfg.topPanelBis.minLength;
            screen = 1;
            widgets = [
              "com.github.antroids.application-title-bar"
              "org.kde.plasma.appmenu"
              "org.kde.plasma.panelspacer"
              "org.kde.plasma.digitalclock"
              "org.kde.plasma.panelspacer"
            ];
          }
        ];
      };
    };
  };
}
