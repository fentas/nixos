{ ... }:
{
  programs.waybar = {
    enable = true;

    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/submap"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "tray"
          "clock"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
          format = "{icon}";
          format-icons = {
            "1:web"  ="";
            "2:code" ="";
            "3:term" ="";
            "4:work" ="";
            "5:music"="";
            "6:docs" ="";
            "urgent" ="";
            "focused"="";
            "default"="";
          };
        };
        "hyprland/submap" = {
          format = "<span style=\\\"italic\\\">{}</span>";
        };
        tray = {
          spacing = 10;
        };
        clock = {
          format = "{:%I:%M p}";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
        };
        memory = {
          format = "{}% ";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = ".";
          format-icons = {
            "headphones" = "";
            "handsfree"  = "";
            "headset"    = "";
            "phone"      = "";
            "portable"   = "";
            "car"        = "";
            "default"    = ["" ""];
          };
          on-click = "pwvucontrol";
        };
      };
    };

    systemd.enable = true;
  };
}
