{ lib, config, namespace, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.${namespace}.programs.terminal.tools.ssh;
in
{
  options.${namespace}.programs.terminal.tools.ssh = {
    enable = mkEnableOption "Whether or not to enable ssh.";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      extraConfig = ''
        Host *
          HostKeyAlgorithms +ssh-rsa
      '';
    };
  };
}
