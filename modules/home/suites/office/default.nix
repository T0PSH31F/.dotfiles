{ config, lib, pkgs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.suites.office;
in
{
  options.${namespace}.suites.office = with types; {
    enable = mkBoolOpt false "Whether or not to enable office configuration.";
    onlyoffice.enable = mkBoolOpt false "Whether or not to enable onlyoffice configuration.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
    #  calibre
    #  calibre-web
      ebook_tools
      getxbook
      koreader
      libreoffice
      mdbook-epub
      texliveBookPub
      obsidian
      zathura
    ]
    ++ lib.optionals cfg.onlyoffice.enable [
      onlyoffice-bin
    ];
  };
}
