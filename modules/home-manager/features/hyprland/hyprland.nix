{ ... }:
{
  wayland.windowManager.hyprland= {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.variables = ["--all"];

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "uwsm app -- alacritty";
      "$fileManager" = "uwsm app -- nautilus";
      "$menu" = "uwsm app -- $(wofi --show=drun --define=drun-print_desktop_file=true)";

      exec-once = [
        "uwsm app -- udiskie"
      ];

      monitor = [
        "desc:Dell Inc. S2719DGF FRG05V2, 2560x1440@144, auto, 1, vrr, 2"
        "desc:Dell Inc. DELL S2721DS 1N3YTY3, 2560x1440@75, auto, 1"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;

        resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        blur = {
          enabled = true;
          size = 16;
          passes = 1;
          #xray = true;
        };
      };
      

      animations = {
        enabled = "yes, please :)";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";

        follow_mouse = 0;
      };

      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, R, exec, $menu"
        "$mod, E, exec, $fileManager"
        "$mod, C, killactive"
        "$mod SHIFT, M, exec, wlogout -b 1 -r 40"
        "$mod, V, togglefloating"
        "$mod, F, fullscreen"
        "$mod, m, exec, hyprlock"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"

        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod SHIFT, s, exec, hyprshot -m region -o ~/Pictures/Screenshots"

      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = 1 + i;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            "$mod CTRL_SHIFT, code:1${toString i}, focusworkspaceoncurrentmonitor, ${toString ws}"
          ]
        ) 9));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      device = [
        {
          name = "wireless-controller-touchpad";
          enabled = 0;
        }
      ];

      layerrule = [
        "blur, wofi"
        "ignorezero, wofi"
        "blur, notifications"
        "ignorezero, notifications"
      ];

      misc = {
        disable_hyprland_logo = true;
        background_color = "rgb(41, 49, 54)";
      };
    };
  };
}
