{ lib, config, namespace, ... }:

let
  inherit (lib) types mkIf mkDefault mkMerge;
  inherit (lib.${namespace}) mkOpt;

  cfg = config.${namespace}.user;

  home-directory =
    if cfg.name == null then
      null
    else
      "/home/${cfg.name}";
in
{

  options.${namespace}.user = {
    enable = mkOpt types.bool true "Whether to configure the user account.";
    name = mkOpt (types.nullOr types.str) (config.snowfallorg.user.name or "t0psh31f") "The user account.";

    fullName = mkOpt types.str "Luffy Taro" "The full name of the user.";
    email = mkOpt types.str "wrighterik77@gmail.com" "The email of the user.";
    gitEmail = mkOpt types.str "wrighterik77@gmail.com" "The email of the user for git.";
    gitUsername = mkOpt types.str "T0PSH31F" "The username for git.";

    home = mkOpt (types.nullOr types.str) home-directory "The user's home directory.";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      assertions = [
        {
          assertion = cfg.name != null;
          message = "t0psh31f.user.name must be set";
        }
        {
          assertion = cfg.home != null;
          message = "t0psh31f.user.home must be set";
        }
      ];

      home = {
        username = mkDefault cfg.name;
        homeDirectory = mkDefault cfg.home;
      };
    }
  ]);
}
