{config, pkgs, inputs, ... }:
{
  users.users = {
    sam = {
      isNormalUser = true;
      description = "Sam T";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };


  inputs.home-manager.nixosModules.home-manager = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.users = {
      sam = import ../../../users/sam/home.nix;
    };
  };
}
