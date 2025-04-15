{
  lib,
  config,
  inputs,
  outputs,
  mylib,
  ...
}:
{
  options.myNixOS.users = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options = {
        userConfig = lib.mkOption {
          type = lib.types.path;
          description = "(required) Path to the Home Manager configuration file for this user.";
          example = "/path/to/some/user/home.nix";
        };

        lib.mkOption {
          default = ../../../users/fentas/home.nix;
        };
        userSettings = lib.mkOption {
          default = {};
        };
      };
    });
    default = {};
  };

  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
        inherit mylib;
        outputs = inputs.self.outputs;
      };

      users =
        builtins.mapAttrs (name: user: {
          imports = [
            (import user.userConfig)
            outputs.homeManagerModules.default
          ];
        })
        (config.myNixOS.users);
    };

    users.users = builtins.mapAttrs (
      name: user:
        {
          isNormalUser = true;
          initialPassword = "12345";
          description = "";
          extraGroups = ["networkmanager" "wheel" "libvirtd"];
        }
        // user.userSettings
    ) (config.myNixOS.users);
  };
}
