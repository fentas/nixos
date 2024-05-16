{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true;

    clipboard.register = "unnamedplus";

    colorschemes = {
      
    };

    options = {
      number = false;
      visualbell = true;

      linebreak = true;
      wrap = false;
    };
  };
}
