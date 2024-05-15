{ config, pkgs, ... }:

{

  users.users.samjt = {
    isNormalUser = true;
    description = "Sam T";
    extraGroups = ["networkmanager" "wheel"];

    shell = pkgs.fish;
  };

}
