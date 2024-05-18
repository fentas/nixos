{ config, pkgs, lib, ... }:

{
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;
  services.printing.enable = true;
}
