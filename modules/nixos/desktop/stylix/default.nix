{
  config,
  pkgs,
  lib,
  namespace,
  ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.stylix;
in {
  options.${namespace}.desktop.stylix = with types; {
    enable = mkBoolOpt false "Whether or not to use stylix as the desktop environment.";
  };

  config = mkIf cfg.enable {
    stylix = {
      autoEnable = true;
      enable = true;
      homeManagerIntegration.autoImport = true;
      homeManagerIntegration.followSystem = true;
      image = ./oxocarbon.png;
      # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # cursor = {
    #   package =  pkgs.breeze-hacked-cursor-theme;   # pkgs.rose-pine-cursor
    #   name = "breeze-hacked-cursor";                # Breezex-Rosepine-Linux
    #   size = 32;
    # };
      fonts = {
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        monospace = {
          name = "JetBrainsMono Nerd Font Mono Regular";
          package = pkgs.nerdfonts;
        };
        sansSerif = {
          name = "Inter Nerd Font";
          package = pkgs.nerdfonts;
        };
        serif = {
          name = "Hack Nerd Font";
          package = pkgs.nerdfonts;
        };
        sizes = {
          desktop = 14;
          terminal = 16;
          popups = 18;
          applications = 14;
                  };
      };
      opacity = {
        desktop = 0.9;
        applications = 0.9;
        terminal = 0.75;
        popups = 0.7;
      };
      polarity = "dark";
      targets = {
        chromium.enable = true;
        console.enable = true;
        fish.enable = true;
        grub.enable = false;
        grub.useImage = true;
        gtk.enable = true;
        lightdm.enable = true;
        nixos-icons.enable = true;
        plymouth.enable = true;
        plymouth.logoAnimated = true;
      #  btop.enable = true;
      #  helix.enable = true;
      #  dunst.enable = true;
      #  firefox.enable = true;
      #  foot.enable = true;
      #  fzf.enable = true;
      #  hyprland.enable = true;
      #  lazygit.enable = true;
      #  emacs.enable = true;
      #  kde.enable = true;
      #  yazi.enable = true;
      #  zellij.enable = true;
        };
      };
    };
  }
