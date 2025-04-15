{ outputs, lib, hostname, ... }:
{
  imports = [outputs.homeManagerModules.default];

  programs.git.userName = "fentas";
  programs.git.userEmail = "jan.guth@gmail.com";

  myHomeManager = {
    bundles.general.enable = true;
    bundles.desktopitems.enable = true;

    bundles.hyprland.enable = true;

    alacritty.enable = true;
    nixvim.enable = true;
    fastfetch.enable = true;
    zellij.enable = true;
  };

  home = {
    username = "fentas";
    homeDirectory = lib.mkDefault "/home/fentas";
    stateVersion = "23.11";
  };
}
