{ inputs, config, lib, mylib, ... }:
{
  options.my-nixos.users = lib.mkOption {
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

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ]
    ++ (mylib.extendModules { dir = ./features; })
    ++ (mylib.extendModules { dir = ./desktops; })
    ++ (mylib.extendModules { dir = ./hardware; })
    ++ (mylib.extendModules { dir = ./pkgs;     default = true; })
    ++ (mylib.extendModules { dir = ./system;   default = true; })
  ;

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "23.11";
  };
}
