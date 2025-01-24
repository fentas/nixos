# Settings specific to my latpop
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";

  myNixOS = {
    bundles.plasma-desktop.enable = true;
    bundles.users.enable = true;

    bundles.engineering.enable = true;
    # bundles.productivity.enable = true;

    amdgpu.enable = false;
    nvidiagpu.enable = true;
    bluetooth.enable = true;
    grub.enable = true;
    steam.enable = true;
    nix.enable = true;
    locale.enable = true;
    # aagl.enable = true;

    xilinx.enable = true;
    matlab.enable = true;
    qemu.enable = true;


    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel"];
          description = "Sam T";
        };
      };
    };
  };

  system.stateVersion = "23.11";

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };
}
