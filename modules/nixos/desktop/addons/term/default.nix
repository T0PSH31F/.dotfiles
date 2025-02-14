{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.desktop.addons.term;
in
{
  options.${namespace}.desktop.addons.term = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome terminal.";
    pkg = mkOpt package pkgs.kitty "The terminal to install.";
  };

  config = mkIf cfg.enable { environment.systemPackages = [
    cfg.pkg
    pkgs.alacritty
    pkgs.foot
    pkgs.rio
    pkgs.socat
    pkgs.ueberzugpp
  #  pkgs.warp-terminal
    pkgs.wezterm

    ]; };
}
