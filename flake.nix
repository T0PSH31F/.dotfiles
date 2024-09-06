{
description = "Hello fellow Straw Hats and Weebs, the best way to navigate the NixOS seas of insanity.
Probably iisn't on this peice of $*** pirate ship! Loot these dots at your own peril! Yo Ho Ho!";

inputs = {
  # NixPkgs (nixos-24.05)
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

  # NixPkgs (nixos-unstable)
  # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  # NixPkgs Master (nixos-unstable)
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

  # Home Manager - Handles Userland Files and Dots Managment
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  # Nix User Repository (master)
    nur.url = "github:nix-community/NUR";

  # Flake Compat
    flake-compat.url = "github:nix-community/flake-compat";
    flake-compat.flake = false;

  # Flake Utils
    flake-utils.url = "github:numtide/flake-utils";

  # Hardware Configuration
    nixos-hardware.url = "github:nixos/nixos-hardware";

  # Generate System Images
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

  # Snowfall Lib - NixOS file/module system lib declaring organized structure for flakes and system management.
    snowfall-lib.url = "github:snowfallorg/lib";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

  # Snowfall Flake - a convenience wrapper for working with flakes.
    snowfall-flake.url = "github:snowfallorg/flake";
    snowfall-flake.inputs.nixpkgs.follows = "nixpkgs";

  # aagl
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

  # Anyrun launcher
    anyrun.url = "github:anyrun-org/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    anyrun-nixos-options.url = "github:n3oney/anyrun-nixos-options";

  # AGS - a customizable and extensible shell
    ags.url = "github:Aylur/ags"; #"github:vaxerski/ags/fix-hl-xd";

  # Arion - Docker Containers
    arion.url = "github:hercules-ci/arion";

  # Catppuccin Rice
    catppuccin-cursors.url = "github:catppuccin/cursors";
    catppuccin.url = "github:catppuccin/nix";

  # Comma - For running nix packages on the fly without declaration.
    comma.url = "github:nix-community/comma";
    comma.inputs.nixpkgs.follows = "nixpkgs";

  # Cowsay - Animated characters for the cmdline
    cowsay = {
      url = "github:snowfallorg/cowsay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Dedsec Grub2 Boot theme
  #  dedsec-grub-theme = {
  #    url = github:VandalByte/dedsec-grub2-theme;
  #    inputs.nixpkgs.follows = "nixpkgs";
  #  };

  # Deployment of Configurations
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";

  # Disko ( Configuration for disk partitioning )
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

  # Emacs-Overlay
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";
    emacs-overlay.inputs.flake-utils.follows = "flake-utils";

  # Hyprland
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Hy3
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

  # Hypridle
    hypridle.url = "github:hyprwm/Hypridle";

  # Hyprlock
    hyprlock.url = "github:hyprwm/Hyprlock";

  # HyprCursors
    # Frappe
      hyprcatppuccin-frappe-dark = {
        url = "https://github.com/entailz/hyprcatppuccin/raw/master/hyprconverted/extracted_Catppuccin-Frappe-Dark-Cursors.tar.gz";
        flake = false;
      };
    # Latte
      hyprcatppuccin-latte-blue = {
        url = "https://github.com/entailz/hyprcatppuccin/raw/master/hyprconverted/extracted_Catppuccin-Latte-Blue-Cursors.tar.gz";
        flake = false;
      };
    # Macchiato
      hyprcatppuccin-macchiato-dark = {
        url = "https://github.com/entailz/hyprcatppuccin/raw/master/hyprconverted/extracted_Catppuccin-Macchiato-Dark-Cursors.tar.gz";
        flake = false;
      };
    # Mocha
      hyprcatppuccin-mocha-dark = {
        url = "https://github.com/entailz/hyprcatppuccin/raw/master/hyprconverted/extracted_Catppuccin-Mocha-Dark-Cursors.tar.gz";
        flake = false;
      };

  # Hyprspace (workspace overview plugin)
    hyprspace.url = "github:KZDKM//Hyprspace";

  # Hyprpaper (wallpaper manager)
    hyprpaper.url = "github:hyprwm/hyprpaper";

  # Hyprland user contributions flake
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Hyprland plugins
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  # Hyprland socket watcher
    hypr-socket-watch = {
      url = "github:khaneliman/hypr-socket-watch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Jerry - Dem Anime's tho...
    jerry.url = "github:justchokingaround/jerry";

  # Lobster - Dem movies tho shhhh....
    lobster.url = "github:justchokingaround/lobster";

  # Lanzaboote - Secure boot(TPM2)
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Nix-index database - For weekly updates and searching packages from cli
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
      };

  # Nix-Gaming  - Packages related to games and gaming
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Nix-helper
    nh.url = "github:viperML/nh";

  # Nix-ld - Run unpatched dynamically compiled binaries
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

  # Nix grub themes
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
    nixos-grub-themes.inputs.nixpkgs.follows = "nixpkgs";

  # NVF nixvim fork by notashelf
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

  # Neovim Nixvim configuration by redyf
  #  Neve.url = "github:redyf/Neve";

  # Nuenv
    nuenv.url = "github:DeterminateSystems/nuenv";

  # Nyaa
    nyaa = {
      url = "github:Beastwick18/nyaa";
      inputs.nixpkgs.follows = "nixpkgs";
          };

  # Ranger Devicons = Icons for Ranger Terminal FM
    ranger-devicons = {
      url = "github:alexanderjeurissen/ranger_devicons";
      flake = false;
    };

  # Plasma-Manager
  #  plasma-manager.url = "github:nix-community/plasma-manager";
  #  plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
  #  plasma-manager.inputs.home-manager.follows = "home-manager";

  # Pre Commit Hooks
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  # Pre-commit-hooks Cachix
    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";

  # Pyprland - Hyprland UI/YX and plugin's written and configured in Python
    pyprland.url = "github:hyprland-community/pyprland";

  # Sops-Nix - Nix encryption & age secret management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Stylix - Uniform Nix themeing and ricing.
    stylix.url = "github:danth/stylix";

  # Spicetify - Spotify theming and extension's
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Walker system runner
    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  # Waybar - Highly customizable WM status bar/UI
    waybar = {
      url = "github:Alexays/Waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Wezterm - GPU-accelerated TTY(Terminal) emulator
    wezterm = {
      url = "github:wez/wezterm?dir=nix";
    };

  # Vault Integration
    vault-service.url = "github:DeterminateSystems/nixos-vault-service";
    vault-service.inputs.nixpkgs.follows = "nixpkgs";

  };


  outputs =
    inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;

        snowfall = {
          namespace = "t0psh31f";

          meta = {
            name = "t0psh31f";
            title = "T0PSH31F's, Snowfall-Lib Structered Nix Flake Config";
          };
        };
      };
    in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      overlays = with inputs; [
        snowfall-flake.overlays.default
        nuenv.overlays.default
        nur.overlay
        emacs-overlay.overlays.default
      ];

      homes.modules = with inputs; [
        nix-index-database.hmModules.nix-index
        ];

      systems.modules.nixos = with inputs; [
        aagl.nixosModules.default
        arion.nixosModules.arion
        disko.nixosModules.disko
      #  dedsec-grub-theme.nixosModule
        home-manager.nixosModules.home-manager
        nvf.nixosModules.default
        vault-service.nixosModules.nixos-vault-service
        stylix.nixosModules.stylix
      ];

      systems.modules.home = with inputs; [
        anyrun.homeManagerModules.default
        hyprland.homeManagerModules.default
        nvf.homeManagerModules.default
        nyaa.homeManagerModules.default
        spicetify-nix.homeManagerModules.default
        walker.homeManagerModules.default
        ];

      deploy = lib.mkDeploy {inherit (inputs) self;};

    #  checks =
    #    builtins.mapAttrs
    #    (system: deploy-lib:
    #      deploy-lib.deployChecks inputs.self.deploy)
    #    inputs.deploy-rs.lib;

    };
}
