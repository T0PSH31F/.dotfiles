''
    # █▀▀ ▀▄▀ █▀▀ █▀▀
    # ██▄ █░█ ██▄ █▄▄

    $config = /home/t0psh31f/.config/hypr/
    $scripts = $config/scipts

    # Fix slow startup
 #  exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once = dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    # Hyprpm for imperitvely installing, troubleshooting, and configuring hyprland specific plugins
    exec-once = hyprpm reload -n
    exec-once = ags &
    exec-once = clipse -listen &
    exec-once = hyprpanel &
    exec-once = udiskie &
    exec-once = walker --gapplication-service &
  # exec-once = swww kill; swww init &
    exec-once = blueman-applet &
    exec-once = nm-applet --indicator # Systray app for /Wifi
    exec-once = swayidle -w timeout 9500 'swaylock -f' timeout 16000 'pidof java || systemctl suspend' before-sleep 'swaylock -f'
# exec-once = wl-clipboard-history -t
# exec-once = wl-paste --type text --watch cliphist store
# exec-once = wl-paste --type image --watch cliphist store
#   exec-once = nextcloud --background


    # █▀▀ █▀█ █░░ █▀█ █░█ █▀█
    # █▄▄ █▄█ █▄▄ █▄█ █▄█ █▀▄

    $defaultBackground = base0A
    $alternateBackground = base0B
    $selectionBackground = base02
    $defaultText = base05
    $alternateText = base04
    $warning = base0A
    $urgent = base09
    $error = base08

    $unfocusedWindowBorder = base03
    $focusedWindowBorder = base0B
    $unfocusedWindowBorderInGroup = base03
    $focusedWindowBorderInGroup = base0D
    $urgentWindowBorder = base08
    $windowTitleText = base05

    $windowBorder = base0D
    $lowUrgencyBackgroundColor = base06
    $lowUrgencyTextColor = base0A
    $highUrgencyBackgroundColor = base0F
    $highUrgencyTextColor = base08
    $incompletePartOfProgressBar = base01
    $completePartOfProgressBar = base02

    # █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
    # █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄

    monitor = eDP-1, disable, auto,
    monitor = DP-1, preferred, auto, 1
    monitor = DP-3, preferred, auto, 1
    monitor = , preferred, auto, 1

    # █ █▄░█ █▀█ █░█ ▀█▀
    # █ █░▀█ █▀▀ █▄█ ░█░

    input {
        kb_layout = us
        kb_options = ctrl:nocaps
        follow_mouse = 1
        numlock_by_default =  true
    touchpad {
            natural_scroll = true
            }
        }

    # █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ █░░
    # █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ █▄▄

    general {
        gaps_in = 8
        gaps_out = 8
        border_size = 3
        col.active_border = $windowBorder $focusedWindowBorder 65deg
        col.inactive_border = $unfocusedWindowBorder $windowBorder 75deg
        layout = dwindle
        resize_on_border = true
            }

    # █▀▄▀█ █ █▀ █▀▀
    # █░▀░█ █ ▄█ █▄▄

    misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    mouse_move_enables_dpms = true
    animate_manual_resizes = true
    mouse_move_focuses_monitor = true
    enable_swallow = true
    focus_on_activate = true
    swallow_regex = ( alacritty | kitty | wezterm | foot | codium )$
    }


    # █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
    # █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█ ░█░ █ █▄█ █░▀█

    decoration {

        # █▀█ █▀█ █░█ █▄░█ █▀▄   █▀▀ █▀█ █▀█ █▄░█ █▀▀ █▀█
        # █▀▄ █▄█ █▄█ █░▀█ █▄▀   █▄▄ █▄█ █▀▄ █░▀█ ██▄ █▀▄

        rounding = 20

        # █▀█ █▀█ ▄▀█ █▀▀ █ ▀█▀ █▄█
        # █▄█ █▀▀ █▀█ █▄▄ █ ░█░ ░█░

        active_opacity = 0.95
        inactive_opacity = 0.9

        # █▀ █░█ ▄▀█ █▀▄ █▀█ █░█░█
        # ▄█ █▀█ █▀█ █▄▀ █▄█ ▀▄▀▄▀



        # █▄▄ █░░ █░█ █▀█
        # █▄█ █▄▄ █▄█ █▀▄

        blur {
            enabled = 1
            size = 3
            passes = 6
            new_optimizations = true
            xray = true
            noise = 0.0117
            contrast = 0.8916
            brightness = 1
            vibrancy = 0.1696
            vibrancy_darkness = 0.5
            special = true
            popups = true
        }
    }


    # ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
    # █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█

    animations {
        enabled = yes

        # █▄▄ █▀▀ ▀█ █ █▀▀ █▀█   █▀▀ █░█ █▀█ █░█ █▀▀
        # █▄█ ██▄ █▄ █ ██▄ █▀▄   █▄▄ █▄█ █▀▄ ▀▄▀ ██▄

        bezier = wind, 0.05, 0.9, 0.1, 1.05
        bezier = winIn, 0.1, 1.1, 0.1, 1.1
        bezier = winOut, 0.3, -0.3, 0, 1
        bezier = linear, 1, 1, 1, 1
        bezier = md3_decel, 0.05, 0.7, 0.1, 1
        bezier = md3_accel, 0.3, 0, 0.8, 0.15
        bezier = overshot, 0.05, 0.9, 0.1, 1.1
        bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
        bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
        bezier = fluent_decel, 0.1, 1, 0, 1
        bezier = easeInOutCirc, 0.85, 0, 0.15, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutExpo, 0.16, 1, 0.3, 1
        bezier = bounce, 0.1, 1.5, 0.42, 0.07

        # ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
        # █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█

        animation = windows, 1, 3, md3_decel, popin 60%
        # animation = windows, 1, 6, wind, slide
        animation = windowsIn, 1, 6, winIn, slide
        animation = windowsOut, 1, 5, winOut, slide
        animation = windowsMove, 1, 5, wind, slide
        animation = layersIn, 1, 6, bounce, fade
        animation = layersOut, 1, 6, bounce, fade
        animation = fade, 1, 10, default
        # animation = fade, 1, 2.5, md3_decel
        animation = fadeIn, 1, 4, md3_decel
        animation = fadeOut, 1, 8, linear
        animation = fadeSwitch, 1, 2, linear
        animation = fadeShadow, 1, 8, linear
        animation = fadeDim, 1, 5, linear
        animation = fadeLayersIn, 1, 4, overshot
        animation = fadeLayersOut, 1, 8, overshot
        animation = border, 1, 10, default
        # animation = border, 1, 10, crazyshot
        # animation = borderangle, 1, 7, overshot
        animation = borderangle, 1, 39, linear
        animation = workspaces, 1, 7, fluent_decel, slidefade 15%
        # animation = workspaces, 1, 5, wind
        animation = specialWorkspace, 1, 3, md3_decel, slidefadevert 15%
        # animation = specialWorkspace, 1, 3, md3_decel, slidevert
    }

    # █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
    # █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█

    dwindle {
    pseudotile = 1 # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
    force_split = 0
    }

    # █▀▀ █▀▀ █▀ ▀█▀ █░█ █▀█ █▀▀ █▀
    # █▄█ ██▄ ▄█ ░█░ █▄█ █▀▄ ██▄ ▄█

    gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = true
    workspace_swipe_fingers=4
    workspace_swipe_direction_lock = true;
    workspace_swipe_create_new = true;
    }

    # █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄
    # █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀

    $notifycmd = notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low

    $mainMod = SUPER

    $term = kitty
    $files = dolphin
    $browser = brave

    # █▀ █▀▀ █▀█ █▀▀ █▀▀ █▄░█ █▀ █░█ █▀█ ▀█▀
    # ▄█ █▄▄ █▀▄ ██▄ ██▄ █░▀█ ▄█ █▀█ █▄█ ░█░

    bind = $mainMod, P, exec, grim -g "$(slurp)" - | swappy -f - # screenshot snip
    bind = $mainMod ALT, P, exec, grim ~/Picture/grim/$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png') # print current screen
    bind = $mainMod, D, exec, display_switcher

    # rec
    bind = CTRL,1,exec,kitty --title fly_is_kitty --hold cava
    bind = CTRL,2,exec,code-insiders
    bind = CTRL,3,exec,kitty --single-instance --hold donut.c
    bind = CTRL,4,exec,kitty --title clock_is_kitty --hold tty-clock -C5

    # █▀▄▀█ █ █▀ █▀▀
    # █░▀░█ █ ▄█ █▄▄

    bind = SUPER, t, exec, kitty --start-as=fullscreen -o 'font_size=25' --title all_is_kitty
    bind = SUPER, RETURN, exec, kitty --title fly_is_kitty
    bind = SUPER, H, exec, alacritty --class clipse -e clipse
    bind = $mainMod, Z, exec, anyrun
    bind = $mainMod SHIFT, T, exec, alacritty
    bind = $mainMod SHIFT, return, exec, wezterm
    bind = $mainMod, F1, exec, $term -e ranger
    bind = $mainMod, S, exec, spotify
    bind = $mainMod, W, exec, firefox
    bind = $mainMod SHIFT, B, exec, killall -SIGUSR2 waybar # Reload waybar
    bind = $mainMod, L, exec, power-menu # lock screen
    # bind = $mainMod, Return, exec, $term
    bind = $mainMod SHIFT, E, exec, $files
    bind = $mainMod, E, exec, thunar
    bind = $mainMod, C, exec, code # open vs code
    bind = $mainMod, B, exec, $browser
    bind = $mainMod, n, exec, nb
    bind = $mainMod, , exec,
    bind = $mainMod SHIFT, X, exec, $colorpicker
    bind = $mainMod, space, exec, launcher
    # bind = $mainMod, N, exec, kitty -- distrobox enter ros-noetic
    # bind = $mainMod, H, exec, kitty -- distrobox enter ros-humble
    bind = $mainMod, A, exec, anyrun
    bind = CTRL, Space, exec, walker

    bind = ,XF86MonBrightnessUp, exec, brightness set +5%
    bind = ,XF86MonBrightnessDown, exec, brightness set 5%-
    bind = ,XF86AudioRaiseVolume, exec, volume -i 5
    bind = ,XF86AudioLowerVolume, exec, volume -d 5
    bind = ,XF86AudioMute, exec, volume -t
    bind = ,XF86AudioMicMute, exec, microphone -t

    # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀▄▀█ ▄▀█ █▄░█ ▄▀█ █▀▀ █▀▄▀█ █▀▀ █▄░█ ▀█▀
    # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █░▀░█ █▀█ █░▀█ █▀█ █▄█ █░▀░█ ██▄ █░▀█ ░█░

    bind = $mainMod, Q, killactive,
    bind = $mainMod SHIFT, Q, exit,
    bind = $mainMod, F, fullscreen,
    bind = $mainMod SHIFT, W, togglefloating,
    bind = $mainMod ALT, P, pseudo, # dwindle
    bind = $mainMod ALT, S, togglesplit, # dwindle

    # Change Workspace Mode
    bind = $mainMod CTRL SHIFT, W, workspaceopt, allfloat
    bind = $mainMod CTRL SHIFT, W, exec, $notifycmd 'Toggled All Float Mode'
    bind = $mainMod ALT SHIFT, P, workspaceopt, allpseudo
    bind = $mainMod ALT SHIFT, P, exec, $notifycmd 'Toggled All Pseudo Mode'
    bind = $mainMod, Tab, cyclenext,
    bind = $mainMod, Tab, bringactivetotop,

    bind = SUPER,g,togglegroup
    bind = SUPER,tab,changegroupactive


    # █▀▀ █▀█ █▀▀ █░█ █▀
    # █▀░ █▄█ █▄▄ █▄█ ▄█

    bind = SUPER, left, exec, hyprnome --previous
    bind = SUPER, right , exec, hyprnome
    bind = SUPER_SHIFT, left, exec, hyprnome --previous --move
    bind = SUPER_SHIFT, right, exec, hyprnome --move

    bind = $mainMod, h, movefocus, l
    bind = $mainMod, l, movefocus, r
    bind = $mainMod, k, movefocus, u
    bind = $mainMod, j, movefocus, d
    bind = $mainMod_ALT, left, movefocus, l
    bind = $mainMod_ALT, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d
    bind = $mainMod, BracketLeft, movefocus, l
    bind = $mainMod, BracketRight, movefocus, r

    # █▀▄▀█ █▀█ █░█ █▀▀
    # █░▀░█ █▄█ ▀▄▀ ██▄

    bind = $mainMod CTRL SHIFT, left, movewindow, l
    bind = $mainMod CTRL SHIFT, right, movewindow, r
    bind = $mainMod CTRL SHIFT, up, movewindow, u
    bind = $mainMod CTRL SHIFT, down, movewindow, d
    bind = $mainMod CTRL , left, workspace, -1
    bind = $mainMod CTRL , right, workspace, +1
    bind = $mainMod CTRL, BracketLeft, workspace, -1
    bind = $mainMod CTRL, BracketRight, workspace, +1
    bind = $mainMod CTRL, up, workspace, -5
    bind = $mainMod CTRL, down, workspace, +5
    bind = $mainMod CTRL SHIFT, right, movetoworkspace, +1
    bind = $mainMod CTRL SHIFT, left, movetoworkspace, -1

    # █▀█ █▀▀ █▀ █ ▀█ █▀▀
    # █▀▄ ██▄ ▄█ █ █▄ ██▄

    bind = $mainMod CTRL, left, resizeactive, -20 0
    bind = $mainMod CTRL, right, resizeactive, 20 0
    bind = $mainMod CTRL, up, resizeactive, 0 -20
    bind = $mainMod CTRL, down, resizeactive, 0 20

    # █▀ █░█░█ █ ▀█▀ █▀▀ █░█
    # ▄█ ▀▄▀▄▀ █ ░█░ █▄▄ █▀█

    bind = SUPER, 1, workspace, 1
    bind = SUPER, 2, workspace, 2
    bind = SUPER, 3, workspace, 3
    bind = SUPER, 4, workspace, 4
    bind = SUPER, 5, workspace, 5
    bind = SUPER, 6, workspace, 6
    bind = SUPER, 7, workspace, 7
    bind = SUPER, 8, workspace, 8
    bind = SUPER, 9, workspace, 9
    bind = SUPER, 0, workspace, 10
    bind = CONTROL ALT, left, workspace, e-1
    bind = CONTROL ALT, right, workspace, e+1

    # █▀▄▀█ █▀█ █░█ █▀▀
    # █░▀░█ █▄█ ▀▄▀ ██▄

    bind = SUPER SHIFT, 1, movetoworkspace, 1
    bind = SUPER SHIFT, 2, movetoworkspace, 2
    bind = SUPER SHIFT, 3, movetoworkspace, 3
    bind = SUPER SHIFT, 4, movetoworkspace, 4
    bind = SUPER SHIFT, 5, movetoworkspace, 5
    bind = SUPER SHIFT, 6, movetoworkspace, 6
    bind = SUPER SHIFT, 7, movetoworkspace, 7
    bind = SUPER SHIFT, 8, movetoworkspace, 8
    bind = SUPER SHIFT, 9, movetoworkspace, 9
    bind = SUPER SHIFT, 0, movetoworkspace, 10

    # █▀▄▀█ █▀█ █░█ █▀ █▀▀   █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀
    # █░▀░█ █▄█ █▄█ ▄█ ██▄   █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█

    bindm = SUPER, mouse:272, movewindow
    bindm = SUPER, mouse:273, resizewindow
    bind = SUPER, mouse_down, workspace, e+1
    bind = SUPER, mouse_up, workspace, e-1

    # bindir = Super, Super_L, exec, ags -t 'overview'

    # █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
    # ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█

    windowrulev2 = move center,title:^(fly_is_kitty)$
    windowrulev2 = size 800 500,title:^(fly_is_kitty)$
    windowrulev2 = animation slide,title:^(all_is_kitty)$
    windowrulev2 = float,title:^(all_is_kitty)$
    windowrulev2 = tile,title:^(kitty)$
    windowrulev2 = float,title:^(fly_is_kitty)$
    windowrulev2 = float,title:^(clock_is_kitty)$
    windowrulev2 = size 418 234,title:^(clock_is_kitty)$

    windowrulev2 = opacity 0.80 0.80,class:^(firefox)$
    windowrulev2 = opacity 0.80 0.80,class:^(steam)$
    windowrulev2 = opacity 0.80 0.80,class:^(steamwebhelper)$
    windowrulev2 = opacity 0.80 0.80,class:^(spotify)$
    windowrulev2 = opacity 0.80 0.80,class:^(code)$
    windowrulev2 = opacity 0.80 0.80,class:^(alacritty)$
    windowrulev2 = opacity 0.80 0.80,class:^(dolphin)$
    windowrulev2 = opacity 0.80 0.80,class:^(nwg-look)$
    windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$
    windowrulev2 = opacity 0.80 0.80,class:^(brave)$

    windowrulev2 = opacity 0.80 0.70,class:^(pavucontrol)$
    windowrulev2 = opacity 0.80 0.70,class:^(blueman-manager)$
    windowrulev2 = opacity 0.80 0.70,class:^(nm-applet)$
    windowrulev2 = opacity 0.80 0.70,class:^(nm-connection-editor)$
    windowrulev2 = opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$

    windowrulev2 = float,class:^(pavucontrol)$
    windowrulev2 = float,class:^(blueman-manager)$
    windowrulev2 = float,class:^(nm-applet)$
    windowrulev2 = float,class:^(nm-connection-editor)$

    windowrulev2 = float, class:(clipse)
    windowrulev2 = size 622 652, class:(clipse)

    # layerrule = xray 1, .*
    layerrule = blur, swaylock
    layerrule = blur, ags
    layerrule = ignorealpha 0.8, ags
    layerrule = blur, gtk-layer-shell
    layerrule = ignorezero, gtk-layer-shell
    layerrule = blur, launcher
    layerrule = ignorealpha 0.5, launcher
    layerrule = blur, notifications
    layerrule = ignorealpha 0.69, notifications
    layerrule = blur, session
''
