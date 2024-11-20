{ config, lib, host ? "", format ? "", inputs ? { }, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.openssh;
  # @TODO(jakehamilton): This is a hold-over from an earlier Snowfall Lib version which used
  # the specialArg `name` to provide the host name.
  name = host;
  authorizedKeys = config.${namespace}.user.authorizedKeys;

  other-hosts = lib.filterAttrs
    (key: host:
      key != name && (host.config.${namespace}.user.name or null) != null)
    ((inputs.self.nixosConfigurations or { }));

  other-hosts-config = lib.concatMapStringsSep
    "\n"
    (name:
      let
        remote = other-hosts.${name};
        remote-user-name = remote.config.${namespace}.user.name;
      in
      ''
        Host ${name}
          IdentityFile ~/.ssh/t0psh31f@${host}.pem
          IdentitiesOnly yes
          User ${remote-user-name}
          ForwardAgent yes
          Port ${builtins.toString cfg.port}
      ''
    )
    (builtins.attrNames other-hosts);
in
{
  options.${namespace}.services.openssh = with types; {
    enable = mkBoolOpt true "Whether or not to configure OpenSSH support.";
    port = mkOpt port 2222 "The port to listen on (in addition to 22).";
    manage-other-hosts = mkOpt bool true "Whether or not to add other host configurations to SSH config.";
  };

  config = mkIf cfg.enable {
    services.openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = if format == "install-iso" then "yes" else "no";
      };

      extraConfig = ''
        StreamLocalBindUnlink yes
      '';

      ports = [
        22
        cfg.port
      ];
    };

    programs.ssh.extraConfig = ''
      Host *
        HostKeyAlgorithms +ssh-rsa

      Host github.com
        IdentityFile ~/.ssh/t0psh31f@Luffy
        IdentitiesOnly yes

      ${optionalString cfg.manage-other-hosts other-hosts-config}
    '';

    t0psh31f.user.extraOptions.openssh.authorizedKeys.keys = authorizedKeys;
  };
}
