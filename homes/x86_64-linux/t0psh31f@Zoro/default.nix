{ lib
, config
, namespace
, ...
}:

let
  inherit (lib.${namespace}) enabled;
in
{
  t0psh31f = {
    user = {
      enable = true;
      inherit (config.snowfallorg.user) name;
    };

    programs = {
      terminal = {
        tools = {
          ssh = enabled;
        };
      };
    };

    suites = {
      common = enabled;
      video = enabled;
    };
  };
}
