{ inputs, ... }:
let
  inherit (inputs) deploy-rs;
in
deploy-rs.lib.${builtins.currentSystem}.deployChecks inputs.self.deploy
