{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.graphical.apps.games.steam;
in
{
  options.t0psh31f.programs.graphical.apps.games.steam = with types; {
    enable = mkBoolOpt false "Whether or not to enable support for Steam.";
    uiScaling = mkBoolOpt false "Whether or not to enable UI scaling for Steam.";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };

    hardware.steam-hardware.enable = true;

    environment.systemPackages = with pkgs; [
      retrofe
      itch
      itchiodl
      mupen64plus
      ppsspp-qt
      dolphin-emu
      lime3ds
      flycast
      snes9x-gtk
      ryujinx
      retroarch
      steamtinkerlaunch
      winetricks
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
      STEAM_FORCE_DESKTOPUI_SCALING = lib.optional (cfg.uiScaling) "2";
    };
  };
}
