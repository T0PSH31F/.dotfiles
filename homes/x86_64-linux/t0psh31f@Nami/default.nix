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
      graphical = {
        browsers = {
          firefox = {
            enable = true;
            gpuAcceleration = true;
            hardwareDecoding = true;
            settings = {
              # "dom.ipc.processCount.webIsolated" = 9;
              # "dom.maxHardwareConcurrency" = 16;
              # "media.av1.enabled" = false;
              # "media.ffvpx.enabled" = false;
              "media.hardware-video-decoding.force-enabled" = true;
              "media.hardwaremediakeys.enabled" = true;
            };
          };
        };
      };

      terminal = {
        tools = {
          ssh = enabled;
        };
      };
    };

    suites = {
      common = enabled;

      development = {
        enable = true;
        aws.enable = true;
      };

      games = enabled;

      graphics = {
        enable = true;
        drawing.enable = true;
      };

      music = enabled;
      office = enabled;
      social = enabled;
      video = enabled;
    };
  };
}
