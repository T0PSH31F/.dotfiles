{ options, config, lib, namespace, ... }:

with lib;
with lib.${namespace};
{
  options.${namespace}.home = with types; {
    file = mkOpt attrs { }
      (mdDoc "A set of files to be managed by home-manager's `home.file`.");
    configFile = mkOpt attrs { }
      (mdDoc "A set of files to be managed by home-manager's `xdg.configFile`.");
    extraOptions = mkOpt attrs { } "Options to pass directly to home-manager.";
  };

  config = {
    t0psh31f.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.${namespace}.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.${namespace}.home.configFile;
    };

    home-manager = {
      # enables backing up existing files instead of erroring if conflicts exist
      backupFileExtension = "old";

      useUserPackages = true;
      useGlobalPkgs = true;

      users.${config.${namespace}.user.name} = mkAliasDefinitions options.${namespace}.home.extraOptions;

      verbose = true;
    };
  };
}
