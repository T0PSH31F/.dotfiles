{ config, lib, namespace, pkgs, ... }:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt enabled;

  cfg = config.${namespace}.suites.common;
in
{
  options.${namespace}.suites.common = {
    enable = mkBoolOpt false "Whether or not to enable common configuration.";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      coreutils
      curl
      duf
      fd
      file
      findutils
      fzf
      jq
      killall
      lf
      lsof
      networkmanager
      networkmanagerapplet
      protonmail-bridge
      pass-wayland
      pciutils
      planify # todo app
      procs
      ranger
      thunderbird
      unrar
      unzip
      wget
      xplorer
    ];

    t0psh31f = {
      programs = {

      graphical = {
        apps = {
              anyrun = enabled;
            # jerry = enabled;
            #  nyaa = enabled;
            # walker = enabled;
                };
        browsers = {
            brave = enabled;
            firefox = enabled;
                    };
        editors = {
            emacs = enabled;
            vscode = enabled;
                      };
        };

        terminal = {
          emulators = {
            alacritty = enabled;
            kitty = enabled;
            wezterm = enabled;
          };

          shells = {
          #  bash = enabled;
            fish = enabled;
            zsh = enabled;
          };

          tools = {
            bat = enabled;
            bottom = enabled;
            comma = enabled;
            direnv = enabled;
            eza = enabled;
            fup-repl = enabled;
            gh = enabled;
            git = enabled;
            home-manager = enabled;
            less = enabled;
            lf =  enabled;
            lsd = enabled;
            mpv = enabled;
            neomutt = enabled;
          #  ohmyposh = enabled;
            ripgrep = enabled;
            starship = enabled;
            yazi = enabled;
            zellij = enabled;
                    };
        };
      };
      services = {
        espanso = enabled;
      };
    };
  };
}
