{ ... }:
{
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [
        ];
        modules-right = [
          "clock"
          "pulseaudio"
          "backlight"
          "network"
          "cpu"
          "memory"
          "temperature"
          "disk"
          "tray"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{name}";
          format-icons = {
            "1" = "󰖟";
            "2" = "";
            "3" = "";
            "4" = "󰭹";
            "5" = "󰕧";
            "6" = "";
            "7" = "";
            "8" = "󰣇";
            "9" = "";
            "10" = "";
          };
          persistent_workspaces = {
            "1"= [];
            "2"= [];
            "3"= [];
            "4"= [];
            "5"= [];
          };
        };
        "hyprland/submap" = {
          format = "<span style=\\\"italic\\\">{}</span>";
        };
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        clock = {
          format = "󰥔 {:%I:%M p}";
          format-alt = "󰃮 {:%Y-%m-%d}";
          tooltim-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-right-click = "mode";
            format = {
              months = "<span color='#d3c6aa'><b>{}</b></span>";
              days = "<span color='#e67e80'>{}</span>";
              weeks = "<span color='#a7c080'><b>W{}</b></span>";
              weekdays = "<span color='#7fbbb3'><b>{}</b></span>";
              today = "<span color='#dbbc7f'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-right-click = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
        cpu = {
          format = " {usage}%";
          tooltip = true;
          interval = 1;
          on-click = "alacritty -e htop";
        };
        memory = {
          format = " {}%";
          interval = 1;
          on-click = "alacritty -e htop";
        };
        network = {
          format-wifi = "󰖩 {essid} ({signalStrength}%)";
          format-ethernet = "󰈀 {ifname}";
          format-linked = "󰈀 {ifname} (No IP)";
          format-disconnected = "󰖪 Disconnected";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format = "{ifname}: {ipaddr}";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "󰂰 {volume}%";
          format-bluetooth-muted = "󰂲 {icon}";
          format-muted = "󰝟";
          format-icons = {
              headphone = "󰋋";
              hands-free = "󰥰";
              headset = "󰋎";
              phone = "󰏲";
              portable = "󰄝";
              car = "󰄋";
              default = ["󰕿" "󰖀" "󰕾"];
          };
          on-click = "pwvucontrol";
        };
        backlight = {
            format = "{icon} {percent}%";
            format-icons = ["󰃞" "󰃟" "󰃠"];
            on-scroll-up = "brightnessctl set +5%";
            on-scroll-down = "brightnessctl set 5%-";
        };
        temperature = {
            critical-threshold = 80;
            format = "{icon} {temperatureC}°C";
            format-icons = ["󱃃" "󰔏" "󱃂"];
        };
        disk = {
            interval = 30;
            format = "󰋊 {percentage_used}%";
            path = "/";
        };
      };
    };

    systemd.enable = true;
  };
}
