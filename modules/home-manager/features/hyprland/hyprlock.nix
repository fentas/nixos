{ ... }:
{
  programs.hyprlock = {
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
        inner_color = "rgba(211,198,170,0.2)";
        font_color = "rgba(41, 49, 54, 1)";
        fade_on_empty = false;
        rounding = -1;
        check_color = "rgb(230,152,117)";
        fail_color = "rgb(230, 126, 128)";
        placeholder_text = "<i><span foreground=\"##293136\">Password...</span></i>";
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(date +\"%A, %B %d\")\"";
          color = "rgba(211, 198, 170, 0.75)";
          font_size = 22;
          position = "0,300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(date +\"%-I:%M\")\"";
          color = "rgba(211, 198, 170, 0.75)";
          font_size = 95;
          position = "0,200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"\$(whoami)\"";
          color = "rgba(211, 198, 170, 0.75)";
          font_size = 14;
          position = "0,-10";
          halign = "center";
          valign = "top";
        }
      ];

      image = [
        {
          monitor = "";
          path = "${../../../../users/fentas/profile.jpeg}";
          size = 75;
          border_size = 2;
          border_color = "rgb(77, 89, 96)";
          rounding = -1;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
