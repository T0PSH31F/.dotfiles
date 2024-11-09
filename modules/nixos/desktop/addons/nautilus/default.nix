{ options, config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.desktop.addons.nautilus;
in
{
  options.${namespace}.desktop.addons.nautilus = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    # Enable support for browsing samba shares.
    programs.nautilus-open-any-terminal.enable = true;
    programs.thunar.enable = true;
    programs.spacefm.enable = true;
    # services.sushi.enable = true;
    services.gvfs.enable = true;
    networking.firewall.extraCommands =
      "iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns";

    environment.systemPackages = with pkgs; [
      nautilus
      mate.caja-with-extensions
      nemo-with-extensions
      nemo-fileroller
      nemo-emblems
      folder-color-switcher
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      ifm-web
      pcmanfm
      ];
  };
}
