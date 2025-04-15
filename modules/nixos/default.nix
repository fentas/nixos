{ config, lib, mylib, ... }:
{
  options.myNixOS = {
    system.enable = lib.mkOption { type = lib.types.bool; default = true; description = "Disable all."; };
    pkgs.enable = lib.mkOption { type = lib.types.bool; default = true; description = "Disable all."; };
  
    users = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options = {
          userConfig = lib.mkOption {
            type = lib.types.path;
            description = "(required) Path to the Home Manager configuration file for this user.";
            example = "/path/to/some/user/home.nix";
          };
          userSettings = lib.mkOption {
            default = {};
          };
        };
      });
      default = {};
    };
  };

  imports =
    (mylib.extendModules { dir = ./features; }) ++
    (mylib.extendModules { dir = ./desktops; prefix = ["desktops"]; }) ++
    (mylib.extendModules { dir = ./pkgs;     prefix = ["pkgs"];     default = true; }) ++
    (mylib.extendModules { dir = ./system;   prefix = ["system"];   default = true; });

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "23.11";
  };
}
