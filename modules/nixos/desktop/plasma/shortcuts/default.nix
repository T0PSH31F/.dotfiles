{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.desktop.plasma.shortcuts;
in
{
  options.${namespace}.desktop.plasma.shortcuts = with types; {
    enable = mkBoolOpt false "Whether or not to configure plasma shortcuts.";
  };

  config = mkIf cfg.enable {
    t0psh31f.home.extraOptions = {
      programs.plasma = {
        shortcuts = {
          "services/kitty"._launch = "Ctrl+Alt+T";
          "emacsclient.desktop".new-instance = "Meta+É";
          "org.kde.dolphin.desktop"._launch = "Meta+E";

          "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";

          kcm_touchpad = {
            "Disable Touchpad" = "Touchpad Off";
            "Enable Touchpad" = "Touchpad On";
            "Toggle Touchpad" = "Touchpad Toggle";
          };

          kded5 = {
            "Show System Activity" = "Ctrl+Esc";
            display = [ "Display" "Meta+P" ];
          };

          kmix = {
            decrease_microphone_volume = "Microphone Volume Down";
            decrease_volume = "Volume Down";
            increase_microphone_volume = "Microphone Volume Up";
            increase_volume = "Volume Up";
            mic_mute = [ "Microphone Mute" "Meta+Volume Mute" ];
            mute = "Volume Mute";
          };

          ksmserver = {
            "Lock Session" = [
              "Meta+Monitor Brightness Up"
              "Meta+Monitor Brightness Down"
              "Screensaver"
            ];
            "Log Out" = "Ctrl+Alt+Del";
          };

          kwin = {
            "Activate Window Demanding Attention" = "Meta+Ctrl+A";
            "Edit Tiles" = "Meta+Alt+Space";
            Expose = "Meta+,";
            ExposeAll = [ "Launch (C)" ];
            ExposeClass = "Ctrl+F7";
            ExposeClassCurrentDesktop = [ "Ctrl+Shift+F7" ];
            "Window No Border" = [ "Meta+Shift+B" "Meta+Alt+B" ];

            "Kill Window" = "Meta+Ctrl+Esc";
            MoveMouseToCenter = "Meta+F6";
            MoveMouseToFocus = "Meta+F5";
            Overview = [ "Meta" "Meta+W" ];

            ShowDesktopGrid = "Meta+F8";
            "Suspend Compositing" = "Alt+Shift+F12";

            "Switch Window Down" = "Meta+T";
            "Switch Window Left" = "Meta+C";
            "Switch Window Right" = "Meta+R";
            "Switch Window Up" = "Meta+S";
            "Switch to Next Desktop" = "Meta+H";
            "Switch to Previous Desktop" = "Meta+G";

            "Walk Through Windows" = "Alt+Tab";
            "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
            "Walk Through Windows Alternative" = "Meta+N";
            "Walk Through Windows Alternative (Reverse)" = "Meta+Shift+N";
            "Walk Through Windows of Current Application Alternative" = "Meta+Ctrl+N";
            "Walk Through Windows of Current Application Alternative (Reverse)" = "Meta+Ctrl+Shift+N";

            "Window Close" = [ "Alt+F4" "Meta+Q" ];
            "Window Fullscreen" = [ "Meta+Ctrl+F" "Meta+Shift+F" "Meta+Shift+Return" "Meta+Ctrl+Return" ];
            "Window Maximize" = [ "Meta+PgUp" "Meta+Return" ];
            "Window Minimize" = "Meta+PgDown";
            "Window On All Desktops" = [ "Meta+Shift+P" "Meta+Alt+A" ];
            "Window One Desktop to the Left" = "Meta+Shift+G";
            "Window One Desktop to the Right" = "Meta+Shift+H";
            "Window Operations Menu" = "Alt+F3";
            "Window Quick Tile Bottom" = "Meta+Down";
            "Window Quick Tile Left" = "Meta+Left";
            "Window Quick Tile Right" = "Meta+Right";
            "Window Quick Tile Top" = "Meta+Up";
            "Window Resize" = "Meta+Alt+R";
            "Window to Next Screen" = [ "Meta+Shift+Right" "Meta+Ctrl+Shift+R" ];
            "Window to Previous Screen" = [ "Meta+Shift+Left" "Meta+Ctrl+Shift+C" ];
            view_actual_size = "Meta+0";
          };

          mediacontrol = {
            nextmedia = "Media Next";
            pausemedia = "Media Pause";
            playpausemedia = "Media Play";
            previousmedia = "Media Previous";
            stopmedia = "Media Stop";
          };

          "org.kde.krunner.desktop" = {
            RunClipboard = "Alt+Shift+F2";
            _launch = [ "Meta+Space" "Alt+F2" "Search" ];
          };

          "org.kde.plasma.emojier.desktop"._launch = "Meta+.";

          "org.kde.spectacle.desktop" = {
            _launch = "Print";
            ActiveWindowScreenShot = "Meta+Shift+Print";
            FullScreenScreenShot = "Shift+Print";
            RectangularRegionScreenShot = "Meta+Print";
            WindowUnderCursorScreenShot = "Meta+Ctrl+Print";
          };

          plasmashell = {
            clipboard_action = "Meta+Ctrl+X";
            cycle-panels = "Meta+Alt+P";
            "next activity" = "Meta+Tab";
            "previous activity" = "Meta+Shift+Tab";
            "show dashboard" = [ "Ctrl+F12" "Meta+D" ];
            show-on-mouse-pos = "Meta+V";
          };

          # Disabled/Unmapped Shortcuts
          kwin = {
            "Setup Window Shortcut" = [ "Meta+Shift+Q" ];
            "Switch One Desktop Down" = [ ];
            "Switch One Desktop Up" = [ ];
            "Switch One Desktop to the Left" = [ ];
            "Switch One Desktop to the Right" = [ ];
            "Switch to Desktop 1" = [ ];
            "Switch to Desktop 2" = [ ];
            "Switch to Desktop 3" = [ ];
            "Switch to Desktop 4" = [ ];
            "Switch to Desktop 5" = [ ];
            "Switch to Desktop 6" = [ ];
            "Switch to Desktop 7" = [ ];
            "Switch to Desktop 8" = [ ];
            "Switch to Desktop 9" = [ ];
            "Switch to Next Screen" = [ ];
            "Switch to Previous Screen" = [ ];
            "Switch to Screen Above" = [ ];
            "Switch to Screen Below" = [ ];
            "Switch to Screen to the Left" = [ ];
            "Switch to Screen to the Right" = [ ];
            "Window Grow Horizontal" = [ ];
            "Window Grow Vertical" = [ ];
            "Window Lower" = [ ];
            "Window Maximize Horizontal" = [ ];
            "Window Maximize Vertical" = [ ];
            "Window Move Center" = [ ];
            "Window Move" = [ ];
            "Window One Desktop Down" = [ ];
            "Window One Desktop Up" = [ ];
            "Window Pack Down" = [ ];
            "Window Pack Left" = [ ];
            "Window Pack Right" = [ ];
            "Window Pack Up" = [ ];
            "Window Quick Tile Bottom Left" = [ ];
            "Window Quick Tile Bottom Right" = [ ];
            "Window Quick Tile Top Left" = [ ];
            "Window Quick Tile Top Right" = [ ];
            "Window Raise" = [ ];
            "Window Shrink Horizontal" = [ ];
            "Window Shrink Vertical" = [ ];
            "Window to Next Desktop" = [ ];
            "Window to Previous Desktop" = [ ];
            "view_zoom_in" = [ ];
            "view_zoom_out" = [ ];

            # Polonium
            PoloniumCycleEngine = "Meta+/";
            PoloniumCycleLayouts = [ ];
            PoloniumFocusAbove = [ ];
            PoloniumFocusBelow = [ ];
            PoloniumFocusLeft = [ ];
            PoloniumFocusRight = [ ];
            PoloniumRebuildLayout = [ ];
            PoloniumResizeTileDown = "Meta+Ctrl+T";
            PoloniumResizeTileLeft = "Meta+Ctrl+C";
            PoloniumResizeTileRight = "Meta+Ctrl+R";
            PoloniumResizeTileUp = "Meta+Ctrl+S";
            PoloniumRetileWindow = "Meta+F";
            PoloniumShowSettings = [ ];
            PoloniumSwapAbove = [ ];
            PoloniumSwapBelow = [ ];
            PoloniumSwapLeft = [ ];
            PoloniumSwapRight = [ ];
            PoloniumEngineBTree = [ ];
            PoloniumEngineHalf = [ ];
            PoloniumEngineKWin = [ ];
            PoloniumEngineMonocle = [ ];
            PoloniumEngineThreeColumn = [ ];
            PoloniumInsertAbove = [ ];
            PoloniumInsertBelow = [ ];
            PoloniumInsertLeft = [ ];
            PoloniumInsertRight = [ ];
          };
          "org.kde.konsole.desktop"._launch = [ ];
          plasmashell = {
            "activate task manager entry 1" = [ ];
            "activate task manager entry 2" = [ ];
            "activate task manager entry 3" = [ ];
            "activate task manager entry 4" = [ ];
            "activate task manager entry 5" = [ ];
            "activate task manager entry 6" = [ ];
            "activate task manager entry 7" = [ ];
            "activate task manager entry 8" = [ ];
            "activate task manager entry 9" = [ ];
            "activate task manager entry 10" = [ ];
          };
          kaccess."Toggle Screen Reader On and Off" = [ ];
        };
      };
    };
  };
}
