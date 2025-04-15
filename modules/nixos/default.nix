{ config, lib, mylib, ... }:
{
  options.myNixOS = {
    system.enable = lib.mkOption { type = lib.types.bool; default = true; description = "Disable all."; };
    pkgs.enable = lib.mkOption { type = lib.types.bool; default = true; description = "Disable all."; };
  };

  imports =
    (mylib.extendModules { dir = ./features; }) ++
    (mylib.extendModules { dir = ./desktops; prefix = ["desktops"]; }) ++
    (mylib.extendModules { dir = ./pkgs;     prefix = ["pkgs"]; default = true; }) ++
    (mylib.extendModules { dir = ./system;   prefix = ["system"]; default = true; });

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "23.11";
  };
}
