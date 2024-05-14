{ config, pkgs, ... }:
{

  networking.networkmanager.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.printing.enable = true;

}
