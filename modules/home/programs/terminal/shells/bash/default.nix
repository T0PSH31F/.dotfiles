{
  config,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.${namespace}.programs.terminal.shells.bash;
in
{
  options.${namespace}.programs.terminal.shells.bash = {
    enable = mkEnableOption "Whether or not to enable bash.";
    prompt-init = mkBoolOpt true "Whether or not to show an initial message when opening a new shell.";
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
        };

    # eza.enableBashIntegration = true;
      fzf.enableBashIntegration = true;
      kitty.shellIntegration.enableBashIntegration = true;
    # oh-my-posh.enableBashIntegration = true;
      starship.enableBashIntegration = true;
      wezterm.enableBashIntegration = true;
      zoxide.enableBashIntegration = true;
    };
  };
}

