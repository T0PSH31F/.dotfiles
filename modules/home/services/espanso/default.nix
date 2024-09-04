{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.services.espanso;
  email = config.${namespace}.user.email;
  gitEmail = config.${namespace}.user.gitEmail;
  fullName = config.${namespace}.user.fullName;
in
{
  options.${namespace}.services.espanso = with types; {
    enable = mkBoolOpt false "Whether or not to enable espanso.";
  };

  config = mkIf cfg.enable {
    services.espanso = {
      enable = true;
      package = pkgs.espanso-wayland;

      configs = {
        default = {
          keyboard_layout = {
            layout = "us";
            };
          backend = "inject";
          inject_delay = 5;
          key_delay = 5;
        };
      };

      matches = {
        email = {
          matches = [
            {
              trigger = "@me";
              replace = email;
            }
            {
              trigger = "@cs";
              replace = gitEmail;
            }
          ];
        };
        date = {
          matches = [
            {
              trigger = ":date";
              replace = "{{mydate}}";
              vars = [
                {
                  name = "mydate";
                  type = "date";
                  params = {
                    format = "%x";
                    locale = "en-US";
                  };
                }
              ];
            }
          ];
        };
        misc = {
          matches = [
            {
              triggers = [ ":me" ":t0psh31f" ];
              replace = fullName;
            }
          ];
        };
        templates = {
          matches = [
            {
              trigger = ":tick";
              replace = ''
                $|$
                ---
                **Refs:**
                -
              '';
            }
          ];
        };
        symbols = {
          backend = "clipboard";
          matches = [
            {
              trigger = ":ar";
              replace = "→";
            }
            {
              trigger = ":al";
              replace = "←";
            }
          ];
        };
      };
    };
  };
}
