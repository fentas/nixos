{ outputs, lib, hostname, ... }:
{
  imports = [outputs.homeManagerModules.default];

  programs.git.userName = "fentas";
  programs.git.userEmail = "jan.guth@gmail.com";

  my-home-manager = {
    desktops.hyprland.enable = true;

    bundles = {
      general.enable = true;
      desktopitems.enable = true;
    };

    features = {  
      enhanced.enable = true;
      alacritty.enable = true;
      nixvim.enable = true;
      fastfetch.enable = true;
      zellij.enable = true;
    };
  };

  home = {
    username = "fentas";
    homeDirectory = lib.mkDefault "/home/fentas";
    stateVersion = "23.11";
  };
}
