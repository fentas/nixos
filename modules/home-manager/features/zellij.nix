{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "custom";

      themes.custom = {
        fg = "#676767";
        bg = "#171717";
        black = "#171717";
        red = "#ab4242";
        green = "#8fa958";
        yellow = "#f4be74";
        blue = "#699eb4";
        magenta = "#aa749e";
        cyan = "#74b4aa";
        white = "#f8f8f8";
        orange = "#c45555";
      };
    };
  };
}
