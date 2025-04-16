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
        {
          isNormalUser = true;
          initialPassword = "12345";
          description = "";
          extraGroups = ["networkmanager" "wheel" "libvirtd"];
        }
        // user.userSettings
    ) (config.my-nixos.users);
  };
}
