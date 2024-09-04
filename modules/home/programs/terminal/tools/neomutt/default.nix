{
  config,
  namespace,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) mkBoolOpt;

  cfg = config.${namespace}.programs.terminal.tools.neomutt;
in {
  options.${namespace}.programs.terminal.tools.neomutt = {
    enable = mkBoolOpt false "Whether to enable neomutt in the terminal";
  };

  config = mkIf cfg.enable {
    programs.neomutt = {
      enable = true;
      editor = "nvim";
      vimKeys = true;
      sidebar = {
        enable = true;
      };
    #  settings = {
    #    mail_check_stats = true;
    #  };
    };

  #   accounts.email.accounts.t0psh31f = {
  #   #  address = "@gmail.com";
  #     neomutt.enable = true;
  #     primary = true;
  #     flavor = "gmail.com";
  #     folders = {
  #       inbox = "Inbox";
  #       drafts = "Drafts";
  #       sent = "Sent";
  #       trash = "Trash";
  #     };
  #    # realName = "";
  #    # aliases = [];
  #   };
  };
}
