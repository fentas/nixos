{ config, pkgs, modulesPath, ...}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix")];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/b88b16f7-fb9b-4ee6-8473-fbb594e71919";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/E01A/95CF";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}