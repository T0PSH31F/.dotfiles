{ config, pkgs, lib, inputs, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.nix;

  substituters-submodule = types.submodule ({ ... }: {
    options = with types; {
      key = mkOpt (nullOr str) null "The trusted public key for this substituter.";
    };
  });
in
{
  options.${namespace}.nix = with types; {
    enable = mkBoolOpt true "Whether or not to manage nix configuration.";
    package = mkOpt package pkgs.nixVersions.latest "Which nix package to use.";

    default-substituter = {
      url = mkOpt str "https://cache.nixos.org" "The url for the substituter.";
      key = mkOpt str "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "The trusted public key for the substituter.";
    };

    builders-use-substitutes = true;

    extra-substituters = mkOpt (attrsOf substituters-submodule)
      {
        "https://ai.cachix.org" = { key = "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="; };
        "https://t0psh31f.cachix.org" = { key = "t0psh31f.cachix.org-1:8Xdk8ilxI1zv/Tig4vx40g1i708jxpUKr9JNZAIN3tI="; };
        "https://anyrun.cachix.org" = { key = "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="; };
        "https://hyprland.cachix.org" = { key = "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="; };
        "https://nix-gaming.cachix.org" = { key = "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="; };
        "https://nixpkgs-wayland.cachix.org" = { key = "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="; };
        "https://nix-community.cachix.org" = { key = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="; };
        "https://walker.cachix.org" = { key = "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="; };
        "https://walker-git.cachix.org" = { key = "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="; };
      } "Extra substituters to configure.";
  };

  config = mkIf cfg.enable {
    assertions = mapAttrsToList
      (name: value: {
        assertion = value.key != null;
        message = "t0psh31f.nix.extra-substituters.${name}.key must be set";
      })
      cfg.extra-substituters;

    environment.systemPackages = with pkgs; [
      t0psh31f.nixos-revision
      (t0psh31f.nixos-hosts.override {
        hosts = inputs.self.nixosConfigurations;
      })
      deploy-rs
      snowfallorg.flake
      nh
      nil
      nix-output-monitor
      nixd
      nixel
      nixfmt-rfc-style
      nixos-bgrt-plymouth
      nix-index
      nix-init
      nix-prefetch-git
      nix-output-monitor
      nvd
      # TODO: revive flake-checker
      # flake-checker
      statix
    ];

    programs.nh = {
      enable = true;
      clean.enable = true;
    };

    nix =
      let
        users = [ "root" config.${namespace}.user.name ] ++
          optional config.services.hydra.enable "hydra";
      in
      {
        package = cfg.package;

        settings = {
          experimental-features = "nix-command flakes";
          http-connections = 50;
          warn-dirty = false;
          log-lines = 50;
          sandbox = "relaxed";
          auto-optimise-store = true;
          trusted-users = users;
          allowed-users = users;

          substituters =
            [ cfg.default-substituter.url ]
            ++
            (mapAttrsToList (name: _value: name) cfg.extra-substituters);
          trusted-public-keys =
            [ cfg.default-substituter.key ]
            ++
            (mapAttrsToList (_name: value: value.key) cfg.extra-substituters);
        };

      #  gc = {
      #    automatic = true;
      #    dates = "weekly";
      #    options = "--delete-older-than 30d";
      #  };

        # flake-utils-plus
        generateRegistryFromInputs = true;
        generateNixPathFromInputs = true;
        linkInputs = true;
      };
  };
}
