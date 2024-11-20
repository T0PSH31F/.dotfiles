{ config, lib, namespace, pkgs, inputs, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt enabled;

  cfg = config.${namespace}.suites.desktop;
in
{
  options.${namespace}.suites.desktop = {
    enable = mkBoolOpt false "Whether or not to enable Hyprland configuration.";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
    # inputs.Neve.packages."x86_64-linux".default
      accountsservice
      aria2
      birdtray
      brightnessctl
      candy-icons
      coreutils
      clipse
      gawk
      gnome-control-center
      gradience
      gruvbox-plus-icons
      hypridle
      hyprlock
      hyprcursor
      hyprpanel
      hyprpicker
      hyprkeys
      hyprland-workspaces
      hyprland-autoname-workspaces
      lavalauncher
      libadwaita
      libinput
      libdbusmenu-gtk3
      libsForQt5.kded
      lxappearance
      material-black-colors
      meson
      nb
      nixos-icons
      nwg-displays
      nwg-look
      nwg-launchers
      nwg-dock-hyprland
      libsForQt5.qt5ct
      qt6ct
      qadwaitadecorations-qt6
      qadwaitadecorations
      swaylock
      swayidle
      swaynotificationcenter
      swayosd
      swww
      openai-whisper
      pamixer
      playerctl
      procps
      rose-pine-icon-theme
      usermount
      wayland-utils
      wayland-protocols
      wl-clipboard
      wlroots
      wlogout
      wlsunset
      wlr-randr
      util-linux
      xwayland
      zathura
      zoxide
          ];

    t0psh31f = {
      programs = {
        graphical = {
          apps = {
                 };
          desktop = {
            addons = {
                 ags = enabled;
                rofi = enabled;
              waybar = enabled;
                wofi = enabled;
            };
            hyprland = enabled;
              };
        };
      };
    };
  };
}
