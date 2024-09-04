{ inputs, config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.plasma;

  defaultPackages = (with pkgs; [
    # Apps
    kdePackages.kweather
    # Themes
    t0psh31f.kde-warm-eyes
    t0psh31f.lightly-qt6
    gruvbox-gtk-theme
    kde-gruvbox
    papirus-nord
    # Widgets & Plasmoids
    application-title-bar
  ]);
in
{
  options.${namespace}.desktop.plasma = with types; {
    enable =
      mkBoolOpt false "Whether or not to use Plasma as the desktop environment.";
    wayland = mkBoolOpt true "Whether or not to use Wayland.";
    touchScreen = mkBoolOpt true "Whether or not to enable touch screen capabilities.";
    autoLoginUser = mkOpt str "t0psh31f" "The user to auto login with.";
  };

  config = mkIf cfg.enable {
    t0psh31f.system.xkb.enable = true;
    t0psh31f.desktop.addons = {
      electron-support = enabled;
    };

   # plasma = {
 #   autoLoginUser = config.${namespace}.user.name;
 #   config = {
 #     virtualDesktopsNames = [
 #       "Mail"
 #       "Video"
 #       "Other"
 #       "Stuff"
 #       "Yes"
 #     ];
 #   };
 #   panels = {
 #     leftPanel.launchers = [
 #       "applications:org.kde.dolphin.desktop"
 #       "applications:firefox-beta.desktop"
 #       "applications:kitty.desktop"
 #       "applications:emacsclient.desktop"
 #       "applications:steam.desktop"
 #     ];
 #   };
 # };

    environment.systemPackages = with pkgs; [
      (hiPrio t0psh31f.xdg-open-with-portal)
      wl-clipboard
    ] ++ (lib.optionals cfg.touchScreen [
      # Virtual keyboard
      maliit-framework
      maliit-keyboard
    ]) ++ defaultPackages;

    services = {
      desktopManager.plasma6.enable = false;

      displayManager = {
        autoLogin = lib.optionalAttrs (cfg.autoLoginUser != "") {
          enable = false;
          user = cfg.autoLoginUser;
        };
        defaultSession = mkIf cfg.wayland "hyprland";
      };

      libinput.enable = true;
    # xserver.enable = true;
    };

    programs.dconf.enable = true;
    programs.kdeconnect.enable = true;

    # Open firewall for samba connections to work.
    networking.firewall.extraCommands =
      "iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns";

    t0psh31f.home.extraOptions = {
      imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
    };
  };
}
