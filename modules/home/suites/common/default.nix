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
      file
      findutils
      killall
      protonmail-bridge
      pass-wayland
      pciutils
      planify # todo app
      procs
      thunderbird
    ];

    t0psh31f = {
      programs = {

      graphical = {
        apps = {
             anyrun = enabled;
              jerry = enabled;
               nyaa = enabled;
                obs = enabled;
             walker = enabled;
                };
        browsers = {
            brave = enabled;
            firefox = enabled;
                    };
        editors = {
            vscode = enabled;
                      };
      # desktop = {
      #     addons = {
      #       spotifyd = enabled;
      #     };

        };


        terminal = {
          emulators = {
            alacritty = enabled;
            kitty = enabled;
            wezterm = enabled;
          };

          shells = {
            bash = enabled;
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
