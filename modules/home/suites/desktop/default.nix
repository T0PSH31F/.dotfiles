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
    #  inputs.Neve.packages."x86_64-linux".default
      inputs.anyrun.packages."x86_64-linux".anyrun
      accountsservice
      aichat
    # adw-gtk3
      aria2
      ags
      blueman
      birdtray
      brightnessctl
      candy-icons
      coreutils
      clipse
      gpt4all
      gawk
      gnome-control-center
      totem
      gtksourceview
      gradience
      gruvbox-plus-icons
      glib
      hypridle
      hyprlock
      hyprcursor
      hyprpanel
      hyprpicker
      hyprkeys
      hyprnome
      hyprland-workspaces
      hyprland-autoname-workspaces
      lavalauncher
      loupe
      libadwaita
      libinput
      libdbusmenu-gtk3
      libsForQt5.kded
      lxappearance
      insync
      material-black-colors
      mission-center
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
      swaybg
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
            anyrun = enabled;
              };
          desktop = {
            addons = {
             # ags = enabled;
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
