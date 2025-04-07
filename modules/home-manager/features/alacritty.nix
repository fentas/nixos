{...}:
{
   programs.alacritty.enable = true;

   programs.alacritty = {
     settings = {
      env.TERM = "xterm-256color";
      font = {
         normal = {
           family = "FiraCode Nerd Font";
           style = "Regular";
         };
         bold = {
           family = "FiraCode Nerd Font";
           style = "Bold";
         };
         size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      window = {
        opacity = 0.8;
        blur = true;
      };

      colors = {
        primary = {
          background = "#272e33";
          foreground = "#d3c6aa";
        };
        normal = {
          black =   "#414b50";
          red =     "#e67e80";
          green =   "#a7c080";
          yellow =  "#dbbc7f";
          blue =    "#7fbbb3";
          magenta = "#d699b6";
          cyan =    "#83c092";
          white =   "#d3c6aa";
        };
        bright = {
          black =   "#475258";
          red =     "#e67e80";
          green =   "#a7c080";
          yellow =  "#dbbc7f";
          blue =    "#7fbbb3";
          magenta = "#d699b6";
          cyan =    "#83c092";
          white =   "#d3c6aa";
        };
      };
     };
   }; 
}
