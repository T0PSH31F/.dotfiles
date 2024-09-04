{ pkgs, lib, inputs, namespace, ... }:

with lib;
with lib.${namespace};
let
  gpgConf = "${inputs.gpg-base-conf}/gpg.conf";

  gpgAgentConf = ''
    pinentry-program /run/current-system/sw/bin/pinentry-curses
  '';
in
{
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    cryptsetup
    gnupg
    pinentry-curses
    pinentry-qt
    paperkey
    wget
    firefox
  ];

  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  t0psh31f = {
    nix = enabled;

    desktop = {
      gnome = {
        enable = true;
      };
    };

    apps = {
      firefox = enabled;
    };

    tools = {
      misc = enabled;
      git = enabled;
    };

    home.file."guide.md".source = guide;
    home.file."guide.html".source = guideHTML;
    home.file."gpg.conf".source = gpgConf;
    home.file."gpg-agent.conf".text = gpgAgentConf;

    home.file.".gnupg/gpg.conf".source = gpgConf;
    home.file.".gnupg/gpg-agent.conf".text = gpgAgentConf;

    security = { doas = disabled; };

    system = {
      fonts = enabled;
      locale = enabled;
      networking = {
        # Networking is explicitly disabled in this environment.
        enable = mkForce false;
      };
      time = enabled;
      xkb = enabled;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
