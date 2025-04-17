{
  lib,
  config,
  inputs,
  outputs,
  mylib,
  ...
}:
{
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
        (config.my-nixos.users);
    };

    users.users = builtins.mapAttrs (
      name: user:
      let
        hashedPasswordFile = config.sops.secrets."users.${name}.password".path;
      in {
        inherit hashedPasswordFile;
        isNormalUser = true;
        description = "";
        extraGroups = ["networkmanager" "wheel" "libvirtd"];
      } // user.userSettings
    ) (config.my-nixos.users);
  };
}
