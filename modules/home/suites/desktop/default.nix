{ config, lib, namespace, pkgs, ... }:
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
    # inputs.Neve.packages.${pkgs.system}.default
    # inputs.anyrun.packages.${pkgs.system}.anyrun
      accountsservice
      adw-gtk3
      ags
      blueman
      bemenu
      birdtray
      brightnessctl
      candy-icons
      cava
      coreutils
      clipman
      cliphist
      curl
      dunst
      feh
      fuzzel
      gpt4all
      gvfs
      gawk
      gnome.gnome-control-center
      nautilus
      totem
      gtksourceview
      gradience
      grim
      gruvbox-plus-icons
      glib
      gvfs
      hypridle
      hyprlock
      hyprcursor
      hyprpicker
      hyprkeys
      hyprland-workspaces
      hyprland-autoname-workspaces
      kanshi
      kdePackages.kio
      kodi-wayland
      lavalauncher
      loupe
      libadwaita
      libinput
      libdbusmenu-gtk3
      libsForQt5.kded
      imagemagick
      insync
      material-black-colors
      mission-center
      meson
      nixos-icons
      nwg-displays
      nwg-look
      nwg-launchers
      nwg-dock-hyprland
      qt5ct
      qadwaitadecorations-qt6
      qadwaitadecorations
      sassc
      slurp
      swappy
      swaybg
      swaylock
      swayidle
      swayosd
      spotify
      swww
      openai-whisper
      overskride
      pamixer
      playerctl
      procps
      rofi-wayland
      rose-pine-icon-theme
      udiskie
      udisks
      usermount
      waybar
      wayland-utils
      wayland-protocols
      wl-clipboard
      wlroots
      wlogout
      wlsunset
      wlr-randr
      wofi
      util-linux
      xwayland
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
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
            hyprland = enabled;
              };
        };
      };
    };
  };
}
