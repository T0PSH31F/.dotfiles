{ lib, config, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  inherit (lib) mkEnableOption mkIf;
  starship = config.${namespace}.programs.terminal.tools.starship;
  cfg = config.${namespace}.programs.terminal.shells.zsh;
in
{
  options.${namespace}.programs.terminal.shells.zsh = {
    enable = mkEnableOption "Whether or not to enable zsh.";
    prompt-init = mkBoolOpt true "Whether or not to show an initial message when opening a new shell.";
  };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;

        initExtraFirst = mkIf starship.enable ''
          starship init zsh | source
        '';

        initExtra = ''
        '' + optionalString cfg.prompt-init ''
          ${pkgs.toilet}/bin/toilet -f future "t0psh31f" --gay
        '';

        shellAliases = {
          say = "${pkgs.toilet}/bin/toilet -f pagga";

          # nix
            n = "nix";
            ns = "nix search --no-update-lock-file nixpkgs";
            nf = "nix flake";
            nfu = "nix flake update";
            nepl = "nix repl '<nixpkgs>'";
            nr = ''nixos-rebuild --use-remote-sudo --flake "$(pwd)#$(hostname)"'';
            nR = "nix run nixpkgs#";
            nS = "nix shell nixpkgs#";
            nrb = "nr build";
            nrs = "nr switch";
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

        plugins = [{
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.4.0";
            sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
          };
        }];
      };


      direnv.enableZshIntegration = true;
      nix-index.enableZshIntegration = true;
      eza.enableZshIntegration = true;
      fzf.enableZshIntegration = true;
      kitty.shellIntegration.enableZshIntegration = true;
    # oh-my-posh.enableZshIntegration = true;
      starship.enableZshIntegration =   true;
      wezterm.enableZshIntegration =    true;
      zoxide.enableZshIntegration = true;

    };
  };
}
