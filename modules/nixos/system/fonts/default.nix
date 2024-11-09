{ config, pkgs, lib, namespace, ... }:

with lib;
with lib.${namespace};
let cfg = config.${namespace}.system.fonts;
in {
  options.${namespace}.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    fonts = mkOpt (listOf package) [ ] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    fonts.packages = with pkgs;
      [
        google-fonts
        powerline-fonts
        line-awesome
        dotcolon-fonts
        terminus-nerdfont
        roboto
        roboto-serif
        minecraftia
        open-sans
        icomoon-feather
        rubik
        creep
        noto-fonts-color-emoji
        material-design-icons
        font-awesome
        nerdfonts
        noto-fonts-color-emoji
        overpass
        zpix-pixel-font
        twitter-color-emoji
        departure-mono
       # joypixels
        ultimate-oldschool-pc-font-pack
        nerd-font-patcher
        pixel-code
        (nerdfonts.override { fonts = [ "Hack" ]; })
      ] ++ cfg.fonts;
  };
}
