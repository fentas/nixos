{pkgs, config, ...}:
{
   programs.alacritty.enable = true;

   programs.alacritty = {
     settings = {
      env.TERM = "xterm-256color";
      font = {
         size = 10;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
     };
   }; 
}
