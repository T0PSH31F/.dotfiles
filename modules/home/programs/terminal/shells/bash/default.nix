{
  config,
  lib,
  namespace,
  ...
}:
with lib;
let
  cfg = config.shells.${namespace}.bash;
  profiles = config.profiles.${namespace};
in
{
  options.shells.${namespace}.bash = {
    enable = mkEnableOption "Bash profile";
  };

  config = mkIf cfg.enable {
    programs = {
      bash = {
        enable = true;
        enableCompletion = true;
        historySize = 10000;
        historyFile = "$HOME/.bash_history";
        historyControl = [
          "ignorespace"
          "erasedups"
        ];
        initExtra = "source $HOME/.shell-init";
      };

    # atuin.enableBashIntegration = true;
      eza.enableBashIntegration = true;
      fzf.enableBashIntegration = true;
      kitty.shellIntegration.enableBashIntegration = true;
    #  oh-my-posh.enableBashIntegration = true;
      starship.enableBashIntegration = true;
      wezterm.enableBashIntegration = true;
    #  zoxide.enableBashIntegration = true;
    };
  };
}
