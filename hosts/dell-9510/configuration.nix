# Settings specific to my latpop
{ self, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "io";

  myNixOS = {
    nvidiagpu.enable = true;
    desktops.hyprland.enable = true;

    qemu.enable = true;
    fish.enable = true;

    pkgs = {
      core.enable = true;
      browsers.enable = true;
      editing.enable = true;
      media.enable = true;
      misc.enable = true;
      office.enable = true;
      programming.enable = true;
      engineering.enable = true;
    };

    users.fentas = {
      userConfig = "${self}/users/fentas/home.nix";
      userSettings = {
        extraGroups = ["networkmanager" "wheel"];
        description = "fentas";
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
  boot.loader.grub = {
    enable = true;
    devices = [ "/dev/nvme0n1" ];
    efiSupport = true;
    useOSProber = false;
  };
  boot.loader.efi.canTouchEfiVariables = true; 
}
