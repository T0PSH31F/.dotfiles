{
  config,
  lib,
  namespace,
  pkgs,
  ...
}:
with lib;
with lib.${namespace}; let
  cfg = config.${namespace}.programs.graphical.browsers.brave;
in {
  options.${namespace}.programs.graphical.browsers.brave = {
    enable = mkBoolOpt false "programs.brave.enable";
  };

  config = mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        {id = "nngceckbapebfimnlniiiahkandclblb";} # Bitwarden
        {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";} # Dark Reader
        {id = "edibdbjcniadpccecjdfdjjppcpchdlm";} # I still dont care about cookies
      ];
    };
  };
}
