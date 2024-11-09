{ lib, config, inputs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.programs.graphical.desktop.addons.waybar;
in
{
  options.${namespace}.programs.graphical.desktop.addons.waybar = with types; {
    enable = mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    xdg.configFile."waybar/waybar.css".source = ./river_style.css;

programs.waybar = {
  enable = true;
  settings = {
    bar = {
      layer = "top";
      position = "top";
      height = 35;
      spacing = 4;
      margin-top = 5;
      margin-bottom = 5;

    modules-left = [
      "custom/launcher"
      "custom/media"
      ];

    modules-center = [
      "idle_inhibitor"
      "custom/updater"
      "custom/snip"
      "custom/wallpaper"
      "pulseaudio"
      "cpu"
      "memory"
      "temperature"
      "backlight"
      "keyboard-state"
      "battery"
      "battery#bat2"
      "network"
      "clock"
      ];

    modules-right = [
    "river/tags"
    "custom/power"
    "tray"
    ];

    "river/tags" = {
            num-tags = 5;
          };
          "keyboard-state" = {
            numlock = true;
            capslock = true;
            format = " {name} {icon}";
            format-icons = {
              locked = "";
              unlocked = "";
            };
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
          "tray" = {
            icon-size = 20;
            spacing = 10;
          };
          "clock" = {
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
          };
          "cpu" = {
            format = "{usage}% ";
            tooltip = false;
          };
          "memory" = {
            format = "{}% ";
          };
          "temperature" = {
            critical-threshold = 80;
            format = "{temperatureF}°F {icon}";
            format-icons = [ "" "" "" ];
          };
          "backlight" = {
            format = "{percent}% {icon}";
            format-icons = [ "" "" ];
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = [ "" "" "" "" "" ];
          };
          "battery#bat2" = {
            bat = "BAT2";
          };
          "network" = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "Connected  ";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
            on-click-right = "bash ~/.config/rofi/wifi_menu/rofi_wifi_menu";
          };
          "pulseaudio" = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-bluetooth-muted = "{icon} {format_source}";
            format-muted = "{format_source}";
            format-source = "";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              "hands-free" = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
            };
            on-click = "pavucontrol";
          };
          "custom/media" = {
            format = "{icon} {}";
            return-type = "json";
            max-length = 20;
            format-icons = {
              spotify = " ";
              default = " ";
            };
            escape = true;
            exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
            on-click = "playerctl play-pause";
          };
          "custom/launcher" = {
            format = "";
            on-click = "wofi --show drun";
            on-click-right = "killall wofi";
          };
          "custom/power" = {
            format = "  ";
            on-click = "nwg-bar";
            on-click-right = "killall nwg-bar";
          };
          "custom/updater" = {
            format = "  {} Update(s)";
            exec = "checkupdates | wc -l";
            exec-if = "[[ $(checkupdates | wc -l) != 0 ]]";
            interval = 15;
            on-click = "alacritty -e yay -Syu && notify-send 'The system has been updated'";
          };
          "custom/snip" = {
            format = " ";
            on-click = "grimshot --notify save area $HOME/Pictures/$(zenity --entry --text 'Set filename:' --entry-text '.png')";
          };
          "custom/wallpaper" = {
            format = " ";
            on-click = "bash ~/.config/system_scripts/pkill_bc";
          };
        };
      };
    };
  };
}