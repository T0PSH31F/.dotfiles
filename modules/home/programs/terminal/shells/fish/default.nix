{ lib, config, pkgs, namespace, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.${namespace}.programs.terminal.shells.fish;
  starship = config.${namespace}.programs.terminal.tools.starship;
in
{
  options.${namespace}.programs.terminal.shells.fish = {
    enable = mkEnableOption "Whether or not to enable fish.";
  };

  config = mkIf cfg.enable {
    programs = {
      fish = {
        enable = true;

        shellInit = mkIf starship.enable ''
          starship init fish | source
        '';

        interactiveShellInit = ''
          set fzf_history_opts "--bind=ctrl-r:toggle-sort,ctrl-z:ignore"
          set -a fzf_history_opts "--nth=4.."
          bind \cr _fzf_search_history # HACK: override CTRL+R binding to the one defined in fzf.fish plugin
        '';

        functions = {
          fish_greeting = ''
            ${pkgs.toilet}/bin/toilet -f future --gay "t0psh31f"
          '';
          rm = "${pkgs.trash-cli}/bin/trash $argv";
          fwifi = {
            body = "nmcli -t -f SSID device wifi list | grep . | sk | xargs -o -I_ nmcli --ask dev wifi connect '_'";
            description = "Fuzzy connect to a wifi";
          };
        };

        shellAbbrs = rec {

          # navigation
          "~~" = "cd $(git rev-parse --show-toplevel)";

          # nix
          n = "nix";
          ns = "nix search --no-update-lock-file nixpkgs";
          nf = "nix flake";
          nfu = "nix flake update";
          nepl = "nix repl '<nixpkgs>'";
          nr = ''nixos-rebuild --use-remote-sudo --flake "$(pwd)#$(hostname)"'';
          nR = "nix run nixpkgs#";
          nS = "nix shell nixpkgs#";
          nrb = "${nr} build";
          nrs = "${nr} switch";
          ncl = ''sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +10'';
          ngc = "nix store gc --debug";
          ndiff = "nix store diff-closures /nix/var/nix/profiles/(ls -r /nix/var/nix/profiles/ | grep -E 'system\-' | sed -n '2 p') /nix/var/nix/profiles/system";
          froots = "find -H /nix/var/nix/gcroots/auto -type l | xargs -I {} sh -c 'readlink {}; realpath {}; echo'";

          # rm
          rmf = "rm -rf";

          # systemd
          sys = "sudo systemctl";
          sysu = "systemctl --user";
          j = "journalctl";
          jb = "journalctl -b";
          ju = "journalctl -u";

          # misc
          q = "exit";
          mkdir = "mkdir -pv";
          y = "wl-copy";
          p = "wl-paste";
          pp = "pwd";
        };

        plugins = [
          {
            name = "done";
            src = pkgs.fishPlugins.done;
          }
          {
            name = "puffer-fish";
            src = pkgs.fishPlugins.puffer;
          }
          {
            name = "pisces";
            src = pkgs.fishPlugins.pisces;
          }
          {
            name = "fzf.fish";
            src = pkgs.fetchFromGitHub {
              owner = "PatrickF1";
              repo = "fzf.fish";
              rev = "8d99f0caa30a626369541f80848ffdbf28e96acc";
              sha256 = "sha256-nTiFD8vWjafYE4HNemyoUr+4SgsqN3lIJlNX6IGk+aQ=";
            };
          }
          {
            name = "colored-man-pages";
            src = pkgs.fishPlugins.colored-man-pages;
          }
          {
            name = "async-prompt";
            src = pkgs.fishPlugins.async-prompt.src;
          }
        ];
      };
    };
  };
}
