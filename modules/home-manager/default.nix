{ config, lib, mylib, ... }:
{
  imports = []
    ++ (mylib.extendModules { dir = ./features; })
    ++ (mylib.extendModules { dir = ./desktops; })
    ++ (mylib.extendModules { dir = ./bundles; })
  ;

  programs.home-manager.enable = lib.mkDefault true;
  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nixos";
  };
}
