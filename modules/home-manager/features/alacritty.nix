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
     };
   }; 
}
