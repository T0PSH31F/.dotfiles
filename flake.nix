{
description = "Hello fellow Straw Hats and Weebs, I hope you can find some use from these dots. I tried to make things as plug and play as possible and will continue to improve! Yo Ho Ho!";

inputs = {
  # NixPkgs (nixos-24.05)
  # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

  # NixPkgs (nixos-unstable)
  # nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  # NixPkgs Master (nixos-unstable)
  # nixpkgs-master.url = "github:nixos/nixpkgs/master";

  # Home Manager - Handles Userland Files and Dots Managment
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  # Nix User Repository (master)
  # nur.url = "github:nix-community/NUR";

  # Flake Compat
    flake-compat.url = "github:nix-community/flake-compat";
    flake-compat.flake = false;

  # Flake Utils
  # flake-utils.url = "github:numtide/flake-utils";

  # Hardware Configuration
    nixos-hardware.url = "github:nixos/nixos-hardware";

  # Generate System Images
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

  # Snowfall Lib - NixOS file/module system lib declaring organized structure for flakes and system management.
    snowfall-lib.url = "github:snowfallorg/lib?ref=v3.0.3";
    snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

  # Snowfall Flake - a convenience wrapper for working with flakes.
    snowfall-flake.url = "github:snowfallorg/flake";
    snowfall-flake.inputs.nixpkgs.follows = "nixpkgs";

  # An Anime Game Launcher
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
  # aagl.inputs.nixpkgs.follows = "nixpkgs";

  # Anyrun launcher
    anyrun.url = "github:anyrun-org/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";
    anyrun-nixos-options.url = "github:n3oney/anyrun-nixos-options";
    anyrun-nixos-options.inputs.nixpkgs.follows = "nixpkgs";

  # AGS - a customizable and extensible shell
    ags.url = "github:Aylur/ags"; #"github:vaxerski/ags/fix-hl-xd";
    ags.inputs.nixpkgs.follows = "nixpkgs";

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
  #  disko.url = "github:nix-community/disko";
  #  disko.inputs.nixpkgs.follows = "nixpkgs";

  # Hyprland
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Hyprspace (workspace overview plugin)
    hyprspace.url = "github:KZDKM//Hyprspace";

  # Hyprpanel (AGS condiguration)
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

  # Hyprland plugins
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

  # Jerry - Dem Anime's tho...
    jerry.url = "github:justchokingaround/jerry";
    jerry.inputs.nixpkgs.follows = "nixpkgs";

  # Lobster - Dem movies tho shhhh....
    lobster.url = "github:justchokingaround/lobster";
    lobster.inputs.nixpkgs.follows = "nixpkgs";

  # Lanzaboote - Secure boot(TPM2)
  #  lanzaboote = {
  #    url = "github:nix-community/lanzaboote/v0.3.0";
  #    inputs.nixpkgs.follows = "nixpkgs";
  #  };

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
    nh.inputs.nixpkgs.follows = "nixpkgs";

  # Nix-ld - Run unpatched dynamically compiled binaries
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

  # Nix grub themes
  #  nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";
  #  nixos-grub-themes.inputs.nixpkgs.follows = "nixpkgs";

  # NVF nixvim fork by notashelf
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      };

  # Neovim Nixvim configuration by redyf
  #  neve.url = "github:redyf/neve";

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
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

  # Pre Commit Hooks
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

  # Sops-Nix - Nix encryption & age secret management
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  # Stylix - Uniform Nix themeing and ricing.
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

   #  supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];
    #  Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
   #  forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    #  Nixpkgs instantiated for supported system types.
   #  nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

       snowfall = {
          namespace = "t0psh31f";

          meta = {
            name = "t0psh31f";
            title = "The Thousand Sunny, Deploying on our quest for One Dots Config!!";
          };
        };
      };
    in
    lib.mkFlake
     {
      channels-config = {
        allowUnfree = true;
       # allowBroken = true;
        allowUnfreePredicate = pkg: true;
        nixpkgs.config.packageOverrides = pkgs: {

        # integrates nur within Home-Manager
        #  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        #    inherit pkgs;
        #    };
        # sha256 = "sha256:1b9ffky4lzwlpq7g9nnyb3zdyq1mz7vd383xd8ji0jyyx3y0vsad";
        };
      };

      overlays = with inputs; [
        hyprpanel.overlay
        snowfall-flake.overlays.default
        ];

      systems.modules.nixos = with inputs; [
        aagl.nixosModules.default
        arion.nixosModules.arion
        catppuccin.nixosModules.catppuccin
      # disko.nixosModules.default
      # dedsec-grub-theme.nixosModules.dedsec-grub-theme
	home-manager.nixosModules.home-manager
        hyprland.nixosModules.default
	nix-ld.nixosModules.nix-ld
      # nur.nixosModules.nur
        nvf.nixosModules.default
        stylix.nixosModules.stylix
	vault-service.nixosModules.nixos-vault-service
      ];

      homes.modules = with inputs; [
        ags.homeManagerModules.default
        anyrun.homeManagerModules.default
        hyprland.homeManagerModules.default
     	nix-index-database.hmModules.nix-index
      # nvf.homeManagerModules.default
        nyaa.homeManagerModule
        spicetify-nix.homeManagerModules.default
        walker.homeManagerModules.default
        ];

    # deploy = lib.mkDeploy {inherit (inputs) self;};

      templates = import ./templates { };

      outputs-builder = channels: { formatter = channels.nixpkgs.nixfmt-rfc-style; };
     # formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    }
   // {
	self = inputs.self;
	};
}
    #  checks =
    #    builtins.mapAttrs
    #    (system: deploy-lib:
    #      deploy-lib.deployChecks inputs.self.deploy)
  #    inputs.deploy-rs.lib;
