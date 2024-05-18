{ config, pkgs, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];
  boot.initrd.kernelModules = [ "amdgpu" ];


}
