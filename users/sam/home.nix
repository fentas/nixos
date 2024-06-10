{ outputs, lib, ... }:
{
  imports = [outputs.homeManagerModules.default];

  programs.git.userName = "Sw3d15h-F1s4";
  programs.git.userEmail = "samjt36@gmail.com";

  myHomeManager = {
    bundles.general.enable = true;

    alacritty.enable = true;
    nixvim.enable = true;
    fastfetch.enable = true;
  };


  home = {
    username = "sam";
    homeDirectory = lib.mkDefault "/home/sam";
    stateVersion = "23.11";

  };
}
