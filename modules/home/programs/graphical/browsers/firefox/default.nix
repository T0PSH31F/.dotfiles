{ config, lib, pkgs, namespace, inputs, ... }:

let
  inherit (lib) types mkIf mkMerge optionalAttrs;
  inherit (lib.${namespace}) mkBoolOpt mkOpt;

  cfg = config.${namespace}.programs.graphical.browsers.firefox;

  firefoxPath = ".mozilla/firefox/${config.${namespace}.user.name}";
in
{
  options.${namespace}.programs.graphical.browsers.firefox = with types;
    {
      enable = mkBoolOpt false "Whether or not to enable firefox.";
      hardwareDecoding = mkBoolOpt false "Enable hardware video decoding.";
      gpuAcceleration = mkBoolOpt false "Enable GPU acceleration.";
      extraConfig = mkOpt str "" "Extra configuration for the user profile JS file.";
      settings = mkOpt attrs { } "Settings to apply to the profile.";
      userChrome = mkOpt str "" "Extra configuration for the user chrome CSS file.";
    };

  config = mkIf cfg.enable {
    home = {
      file = mkMerge [
        # Fix tridactyl & plasma integration
        {
          "${firefoxPath}/native-messaging-hosts".source = pkgs.symlinkJoin {
            name = "native-messaging-hosts";
            paths = [
              "${pkgs.plasma-browser-integration}/lib/mozilla/native-messaging-hosts"
              "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts"
            ];

            recursive = true;
          };
          "${firefoxPath}/chrome/" = {
            source = lib.cleanSourceWith {
              src = lib.cleanSource ./chrome/.;
            };

            recursive = true;
          };
        }
      ];
    };

    # Tridactyl
    xdg.configFile."tridactyl/tridactylrc".source = ./tridactyl/tridactylrc;
    xdg.configFile."tridactyl/themes/everforest-dark.css".source =
      ./tridactyl/tridactyl_style_everforest.css;

    programs.firefox = {
      enable = true;

      package = pkgs.firefox-beta.override (orig: {
        nativeMessagingHosts =
          (orig.nativeMessagingHosts or [ ]) ++ [
            pkgs.tridactyl-native
            pkgs.plasma-browser-integration
          ];
      });

      policies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = true;
        DontCheckDefaultBrowser = true;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };

        PasswordManagerEnabled = false;
        PromptForDownloadLocation = true;

        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };

        ExtensionSettings = {
          "ebay@search.mozilla.org".installation_mode = "blocked";
          "amazondotcom@search.mozilla.org".installation_mode = "blocked";
          "bing@search.mozilla.org".installation_mode = "blocked";
          "ddg@search.mozilla.org".installation_mode = "blocked";
          "wikipedia@search.mozilla.org".installation_mode = "blocked";

          "tridactyl".installation_mode = "force_installed";

          "frankerfacez@frankerfacez.com" = {
            installation_mode = "force_installed";
            install_url =
              "https://cdn.frankerfacez.com/script/frankerfacez-4.0-an+fx.xpi";
          };

          "magnolia_limited_permissions@12.34" = {
            installation_mode = "force_installed";
            install_url =
              "https://gitlab.com/magnolia1234/bpc-uploads/-/raw/master/bypass_paywalls_clean-3.2.3.0-custom.xpi";
          };

          "ATBC@EasonWong" = {
            installation_mode = "force_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/file/4159211/adaptive_tab_bar_colour-2.1.4.xpi";
          };

          "bento" = {
            installation_mode = "force_installed";
            install_url =
              "https://addons.mozilla.org/firefox/downloads/file/3787567/bento-1.7.xpi";
          };

        };
        Preferences = { };
      };


      profiles.${config.${namespace}.user.name} = {
        inherit (cfg) extraConfig;
        inherit (config.${namespace}.user) name;

        id = 0;

      #  extensions = with pkgs; [
      #    auto-tab-discard
      #    bitwarden
      #    consent-o-matic
      #    darkreader
      #    enhancer-for-youtube
      #    firefox-color
      #    french-language-pack
      #    languagetool
      #    org-capture # TODO: setup
      #    plasma-integration
      #    reddit-enhancement-suite
      #    refined-github
      #    sidebery
      #    simple-tab-groups
      #    sponsorblock
      #    stylus
      #    tabcenter-reborn
      #    tridactyl
      #    ublock-origin
      #    user-agent-string-switcher
      #  ];

        search = {
          default = "Google";
          privateDefault = "DuckDuckGo";
          force = true;

          engines = {
            "Nix Packages" = {
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "n" ];
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };

            "NixOS Options" = {
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "no" ];
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };

            "GitHub" = {
              iconUpdateURL = "https://github.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "gh" ];

              urls = [
                {
                  template = "https://github.com/search";
                  params = [
                    {
                      name = "q";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };

            "Home Manager" = {
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "hm" ];

              url = [
                {
                  template = "https://mipmip.github.io/home-manager-option-search/";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
            };

          };
        };

        settings = mkMerge [
          cfg.settings
          {
            "accessibility.typeaheadfind.enablesound" = false;
            "accessibility.typeaheadfind.flashBar" = 0;
            "browser.aboutConfig.showWarning" = false;
            "browser.aboutwelcome.enabled" = false;
            "browser.bookmarks.autoExportHTML" = true;
            "browser.bookmarks.showMobileBookmarks" = true;
            "browser.meta_refresh_when_inactive.disabled" = true;
            "browser.newtabpage.activity-stream.default.sites" = "";
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.search.hiddenOneOffs" = "Google,Amazon.com,Bing,DuckDuckGo,eBay,Wikipedia (en)";
            "browser.search.suggest.enabled" = false;
            "browser.sessionstore.warnOnQuit" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.ssb.enabled" = true;
            "browser.startup.homepage.abouthome_cache.enabled" = true;
            "browser.startup.page" = 3;
            "browser.translations.neverTranslateLanguages" = "fr";
            "browser.urlbar.keepPanelOpenDuringImeComposition" = true;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "devtools.chrome.enabled" = true;
            "devtools.debugger.remote-enabled" = true;
            "dom.storage.next_gen" = true;
            "dom.forms.autocomplete.formautofill" = true;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "general.autoScroll" = false;
            "general.smoothScroll.msdPhysics.enabled" = true;
            "geo.enabled" = false;
            "geo.provider.use_corelocation" = false;
            "geo.provider.use_geoclue" = false;
            "geo.provider.use_gpsd" = false;
            "intl.accept_languages" = "en-US = en";
            "media.eme.enabled" = true;
            "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "font.name.monospace.x-western" = "MonaspiceKr Nerd Font";
            "font.name.sans-serif.x-western" = "MonaspiceNe Nerd Font";
            "font.name.serif.x-western" = "MonaspiceNe Nerd Font";
            "signon.autofillForms" = false;
          }
          (optionalAttrs cfg.gpuAcceleration {
            "dom.webgpu.enabled" = true;
            "gfx.webrender.all" = true;
            "layers.gpu-process.enabled" = true;
            "layers.mlgpu.enabled" = true;
          })
          (optionalAttrs cfg.hardwareDecoding {
            "media.av1.enabled" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "media.ffvpx.enabled" = false;
            "media.gpu-process-decoder" = true;
            "media.hardware-video-decoding.enabled" = true;
            "media.rdd-ffmpeg.enabled" = true;
            "media.rdd-vpx.enabled" = false;
            "widget.dmabuf.force-enabled" = true;
          })
        ];

        userChrome = builtins.readFile ./chrome/userChrome.css + ''
          ${cfg.userChrome}
        '';
      };
    };
  };
}
