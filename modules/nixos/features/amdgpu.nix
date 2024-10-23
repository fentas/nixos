{ pkgs, ... }:
{
  # hardware.opengl = {
  #   enable = true;
  #   driSupport32Bit = true;
  #
  #   extraPackages = with pkgs; [
  #     rocmPackages.clr.icd
  #   ];
  # };
  #
  # boot.initrd.kernelModules = [ "amdgpu" ];

  # new amdgpu module does all of the above, essentially.
  hardware.amdgpu = {
    initrd.enable = true;
    opencl.enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "modesetting" ];

}
