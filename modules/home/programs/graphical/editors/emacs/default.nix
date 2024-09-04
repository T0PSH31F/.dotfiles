{ lib, config, pkgs, namespace, ... }:

let
  inherit (lib) mkIf types;
  inherit (lib.${namespace}) mkOpt mkBoolOpt;

  cfg = config.${namespace}.programs.graphical.editors.emacs;
in
{
  options.${namespace}.programs.graphical.editors.emacs = {
    enable = mkBoolOpt false "Whether or not to enable emacs.";
    package = mkOpt types.package pkgs.emacs-pgtk "The emacs package to be used.";
  };

  config = mkIf cfg.enable {

    services.emacs = {
      enable = true;
      inherit (cfg) package;
    };

    programs.emacs = {
      enable = true;
      inherit (cfg) package;
      extraPackages = (epkgs: with epkgs; [ vterm pdf-tools sqlite ]);
    };

    home = {
      packages = with pkgs; [
        djvu2pdf
        gcc
        sqlite
        cmake
        texlive.combined.scheme-full
        (aspellWithDicts (ds: with ds; [ en en-computers en-science fr ]))
      ];

      sessionPath = [ "$XDG_CONFIG_HOME/emacs/bin" ];
      shellAliases = { "ne" = "emacsclient -nw"; };
    };
  };
}
