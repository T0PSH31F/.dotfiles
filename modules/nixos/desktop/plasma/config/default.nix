{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.plasma.config;
in
{
  options.${namespace}.desktop.plasma.config = with types; {
    enable = mkBoolOpt false "Whether or not to configure plasma config.";
    virtualDesktopsNames = mkOpt (listOf str) [ "Desktop 1" "Desktop 2" "Desktop 3" "Desktop 4" ] "The names to give to the virtual desktops";
  };

#  config = mkIf cfg.enable {
#    t0psh31f.home.extraOptions = {
#      programs.plasma = {
#        enable = false;
#
#        workspace = {
#          clickItemTo = "open";
#          tooltipDelay = 5;
#          cursor.theme = "breeze_cursors";
#          colorScheme = "Gruvbox";
#          lookAndFeel = "org.kde.breezetwilight.desktop";
#        };
#
#        kwin = {
#          effects = {
#            shakeCursor.enable = false;
#            desktopSwitching.animation = "slide";
#          };
#
#          virtualDesktops = {
#            rows = 1;
#            names = cfg.virtualDesktopsNames;
#          };
#        };
#
#        configFile = {
#          baloofilerc."Basic Settings".Indexing-Enabled = false;
#
#          dolphinrc.VersionControl.enabledPlugins = "Git";
#
#          ## Peripherals
#
#          # Tablet settings
#          kcminputrc = {
#            "ButtonRebinds.Tablet.Wacom Intuos BT S Pad"."0" = "Key,Ctrl+Z";
#            "ButtonRebinds.Tablet.Wacom Intuos Pro S Pad"."0" = "Key,Ctrl+Z";
#            "ButtonRebinds.Tablet.Wacom Intuos Pro S Pad"."6" = "Key,Ctrl+Z";
#            "Libinput.1386.914.Wacom Intuos Pro S Finger"."NaturalScroll" = true;
#            "Libinput.1386.914.Wacom Intuos Pro S Finger"."PointerAccelerationProfile" = 1;
#            # Mouse settings
#            "Libinput.1133.16511.Logitech G502"."PointerAccelerationProfile" = 1;
#            Mouse.X11LibInputXAccelProfileFlat = false;
#            Keyboard.NumLock = 0; # enable numlock
#          };
#
#          kdeglobals.KDE.widgetStyle = "Lightly";
#
#          kwinrc = {
#            Effect-blur.BlurStrength = 3;
#            Effect-diminactive.DimFullScreen = false;
#            Effect-overview.BorderActivate = 7;
#            Effect-overview.BorderActivateAll = 9;
#            ElectricBorders.TopRight = "LockScreen";
#
#            NightColor = {
#              Active = true;
#              NightTemperature = 3800;
#            };
#
#            Plugins = {
#              blurEnabled = true;
#              contrastEnabled = true;
#              diminactiveEnabled = true;
#            };
#
#            Windows = {
#              BorderlessMaximizedWindows = true;
#              CenterSnapZone = 100;
#              ElectricBorderCooldown = 400;
#              ElectricBorderDelay = 350;
#              FocusPolicy = "FocusFollowsMouse";
#              NextFocusPrefersMouse = true;
#            };
#
#            "org.kde.kdecoration2" = {
#              BorderSize = "Tiny";
#              BorderSizeAuto = false;
#              library = "org.kde.breeze";
#              theme = "Breeze";
#            };
#          };
#
#          krunnerrc = {
#            General.FreeFloating.value = true;
#
#            Plugins.appstreamEnabled = false;
#          };
#
#          Plugins = {
#            cubeEnabled.value = true;
#            dimscreenEnabled.value = true;
#            shakecursorEnabled.value = true;
#            sheetEnabled.value = true;
#            wobblywindowsEnabled.value = true;
#          };
#        };
#
#        # configFile = {
#        #   "dolphinrc"."MainWindow.Toolbar mainToolBar"."ToolButtonStyle" = "IconOnly";
#        #   "dolphinrc"."Toolbar mainToolBar"."ToolButtonStyle" = "IconOnly";
#
        #   "kdeglobals"."KDE"."ShowDeleteCommand" = false;
        #   "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
        #   "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
        #   "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
        #   "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
        #   "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
        #   "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
        #   "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
        #   "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
        #   "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
        #   "kdeglobals"."KFileDialog Settings"."Show hidden files" = true;
        #   "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
        #   "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
        #   "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
        #   "kdeglobals"."KFileDialog Settings"."Sort reversed" = true;
        #   "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 138;
        #   "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
        #   "kdeglobals"."WM"."activeBackground" = "108,78,70";
        #   "kdeglobals"."WM"."activeBlend" = "118,144,40";
        #   "kdeglobals"."WM"."activeForeground" = "217,213,197";
        #   "kdeglobals"."WM"."inactiveBackground" = "90,84,51";
        #   "kdeglobals"."WM"."inactiveBlend" = "143,133,117";
        #   "kdeglobals"."WM"."inactiveForeground" = "158,155,140";

        #   "klaunchrc"."BusyCursorSettings"."Timeout" = 3;
        #   "klaunchrc"."TaskbarButtonSettings"."Timeout" = 3;

        #   "klipperrc"."General"."IgnoreImages" = false;
        #   "klipperrc"."General"."MaxClipItems" = 30;

        #   "krunnerrc"."Runners.CharacterRunner"."aliases" = "ar";
        #   "krunnerrc"."Runners.CharacterRunner"."codes" = 002192;
        #   "krunnerrc"."Runners.CharacterRunner"."triggerWord" = "$";
        #   "krunnerrc"."Runners.Dictionary"."triggerWord" = "=";
        #   "krunnerrc"."Runners.Kill Runner"."sorting" = 1;
        #   "krunnerrc"."Runners.Kill Runner"."triggerWord" = "kill";
        #   "krunnerrc"."Runners.Kill Runner"."useTriggerWord" = true;
        #   "krunnerrc"."Runners.krunner_spellcheck"."requireTriggerWord" = true;
        #   "krunnerrc"."Runners.krunner_spellcheck"."trigger" = "~";
        # };
      }

