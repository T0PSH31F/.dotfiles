{ lib, config, namespace, ... }:

let
  inherit (lib) types mkEnableOption mkIf;
  inherit (lib.${namespace}) mkOpt enabled;

  cfg = config.${namespace}.programs.terminal.tools.git;
  user = config.${namespace}.user;
  fish = config.${namespace}.programs.terminal.shells.fish;
in
{
  options.${namespace}.programs.terminal.tools.git = {
    enable = mkEnableOption "Whether or not to enable git.";
    userName = mkOpt types.str user.gitUsername "The name to configure git with.";
    userEmail = mkOpt types.str user.gitEmail "The email to configure git with.";
    # FIXME: setup ssh keys
    signingKey = mkOpt types.str "" "The key ID to sign commits with.";
    signByDefault = mkOpt types.bool false "Whether to sign commits by default.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      inherit (cfg) userName userEmail;
      lfs = enabled;

      signing = {
        key = cfg.signingKey;
        inherit (cfg) signByDefault;
      };

      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = true; };
        push = { autoSetupRemote = true; };
        core = { whitespace = "trailing-space,space-before-tab"; };
        safe = {
          directory = "${user.home}/.config.${namespace}";
        };
      };
    };

    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.version = 1;
    };

    programs.fish = mkIf fish.enable {
      shellAbbrs = {
        g = "git";
        ga = "git add";
        "ga." = "git add .";
        gamend = "git commit --amend --no-edit";
        gb = "git branch";
        gc = "git commit";
        gcl = "git clone";
        gl = ''git log --graph --pretty="format:%C(yellow)%h%Creset %C(red)%G?%Creset%C(green)%d%Creset %s %Cblue(%cr) %C(bold blue)<%aN>%Creset"'';
        gco = "git checkout";
        gd = "git diff";
        gdt = "git difftool";
        gds = "git diff --staged";
        gp = "git push";
        gpf = "git push --force-with-lease";
        gf = "git fetch";
        gF = "git pull";
        grc = "git rebase --continue";
        gri = "git rebase --interactive";
        gra = "git rebase --abort";
        grs = "git rebase --skip";
        gs = "git status --short";
        gS = "git status";
        gst = "git stash";
        gstl = "git stash list";
        gstp = "git stash pop";
      };
    };
  };
}
