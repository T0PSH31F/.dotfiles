{ config, lib, pkgs, inputs, namespace, ... }:
with lib;
with lib.${namespace};
let
  compileSCSS = name: source: "${pkgs.runCommandLocal name {} ''
    mkdir -p $out
    ${lib.getExe pkgs.sassc} -t expanded '${source}' > $out/${name}.css
  ''}/${name}.css";
  cfg = config.${namespace}.programs.graphical.apps.anyrun;
in
{
  imports = [inputs.anyrun.homeManagerModules.default];

  options.${namespace}.programs.graphical.apps.anyrun = {
    enable = mkBoolOpt false "Whether or not to enable support for anyrun";
  };

  config = mkIf cfg.enable {

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun-nixos-options.packages.${pkgs.system}.default
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.rink
        inputs.anyrun.packages.${pkgs.system}.kidex
        inputs.anyrun.packages.${pkgs.system}.shell
        inputs.anyrun.packages.${pkgs.system}.dictionary
        inputs.anyrun.packages.${pkgs.system}.websearch
        inputs.anyrun.packages.${pkgs.system}.randr
      ];

      #plugins = [
      #
      #  /lib/applications
      #  /lib/dictionary
      #  /lib/websearch
      #  /lib/rink
      #  /lib/kidex
      #  /lib/randr
      #  /lib/shell
      #];

      x = { fraction = 0.5; };
      y = { fraction = 0.5; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };

    extraCss = builtins.readFile (compileSCSS "style" ./style.scss);

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
         // Also show the Desktop Actions defined in the desktop files, e.g. "New Window" from LibreWolf
        desktop_actions: false,
        max_entries: 10,
        // The terminal used for running terminal based desktop entries, if left as `None` a static list of terminals is used
       // to determine what terminal to use.
        terminal: Some("alacritty"),
      )
    '';

    "kidex.ron".text = ''
        Config(
        max_entries: 3,
          )
    '';

    "dictionary.ron".text = ''
        Config(
      prefix: ":def",
      max_entries: 5,
          )
    '';

    "randr.ron".text = ''
      Config(
      prefix: ":dp",
      max_entries: 3,
          )
    '';

    "shell.ron".text = ''
      Config(
      prefix: ":sh",
      // Override the shell used to launch the command
      shell: None,
      )
    '';

    "websearch.ron".text = ''
        Config(
          prefix: "?",
          engines: [
            duckduckgo,

            Custom(
              name: "SearXNG",
              url: "100.121.201.47:8100/search?q={}",
            ),

            Custom(
              name: "nix packages",
              url: "search.nixos.org/packages?query={}&channel=unstable",
            ),

          ],
        )
      '';
      };
    };
  };
}