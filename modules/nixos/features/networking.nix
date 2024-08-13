{ lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.useDHCP = lib.mkDefault true;

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
