{ config, lib, ... }:
{
  options = with lib; with types; {
    default_monitor = mkOption { type = str; };
  };


  config.programs.hyprlock = {
    enable = true;
    package = null;
    settings = {
      background = {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibracny_darkness = 0.2;
      };

      input-field = {
        monitor = "";
        size = "250, 60";
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        outer_color = "rgba(0,0,0,0)";
        inner_color = "rgba(242,243,244,0.2)";
        font_color = "$foreground";
        fade_on_empty = false;
        rounding = -1;
        check_color = "rgb(204,136,34)";
        fail_color = "rgb(204, 34, 34, 1.0)";
        placeholder_text = "<i><span foreground=\"##cdd6f4\">Password...</span></i>";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(date +\"%A, %B %d\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          position = "0,300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(date +\"%-I:%M\")\"";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          position = "0,200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(whoami)\"";
          color = "$foreground";
          font_size = 14;
          position = "0,-10";
          halign = "center";
          valign = "top";
        }
      ];

      image = [
        {
          monitor = "";
          path = "${../../../../users/sam/profile.png}";
          size = 75;
          border_size = 2;
          border_color = "$foreground";
          rounding = -1;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
