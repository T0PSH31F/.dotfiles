{ options
, config
, lib
, pkgs
, ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.module;
in
{
  options.module = with types; {
    enable = mkBoolOpt false "Enable module";
  };

  config =
    mkIf cfg.enable { };
}
