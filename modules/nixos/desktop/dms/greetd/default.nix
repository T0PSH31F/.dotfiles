{


  # greetd display manager
  # services.greetd = let
  #   session = {
  #     command = "${lib.getExe config.programs.hyprland.package}";
  #     user = "t0psh31f";
  #   };
  # in {
  #  enable = true;
  #  settings = {
  #    terminal.vt = 1;
  #    default_session = session;
  #    initial_session = session;
  #  };
  # };

  # unlock GPG keyring on login
  # security.pam.services.greetd.enableGnomeKeyring = true;
}
