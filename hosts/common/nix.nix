{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
