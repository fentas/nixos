{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        {
          type= "title";
          color= {
            at= "white";
            user= "light_blue";
            host= "cyan";
          };
          key= "   ";
          keyWidth= 6;
        }
        {
          type= "break";
        }
        {
          type= "os";
          format= "{3}";
          key= "├  OS";
        }
        {
          type= "uptime";
          key= "├ 󰔛 Up";
        }
        {
          type= "shell";
          format= "{6}";
          key= "├  Shell";
        }
        {
          type= "de";
          key= "├  DE";
        }
        {
          type= "wm";
          key= "├  WM";
        }
        {
          type= "theme";
          format= "";
          key= "├  Theme";
        }
        {
          type= "terminal";
          format= "{5}";
          key= "├  Term";
        }
        {
          type= "cpu";
          format= "{1}";
          key= "├  CPU";
        }
        {
          type= "gpu";
          format= "{2}";
          key= "├  GPU";
        }
        {
          type= "memory";
          format= "{2}";
          key= "├  RAM";
        }
        "break"
        "colors"
      ];
      logo = {
        source = ./icon.txt;
      };
      display = {
        key.width = 12;
        separator = " ";
      };
    };
  };
}
