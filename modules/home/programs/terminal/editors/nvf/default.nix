{
  config,
  lib,
  pkgs,
  inputs,
  namespace,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.editors.nvf;
in {
   options.${namespace}.programs.terminal.editors.nvf = {
    enable = mkBoolOpt false "whether or mot to enable Nix-Helper";
  };

  config = mkIf cfg.enable {
   home.packages = [ pkgs.neovim  ];
      # your settings need to go into the settings attribute set
      # most settings are documented in the appendix
     # settings = {
     #   vim = {
     #     viAlias = false;
     #     vimAlias = true;
     #     lsp = {
     #       enable = true;
            #    formatOnSave = true;
            #    lightbulb.enable = true;
            #    lspsaga.enable = false;
            #    trouble.enable = true;
            #    lspSignature.enable = true;
    #      };
    #    };
    #  };
  #  };
  };
}

