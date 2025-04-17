# Settings specific to my latpop
{ self, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "io";

  sops = {
    # enable = true;
    age.sshKeyPaths = [
      "/etc/ssh/nixos-secrets"
    ];
    
    defaultSopsFile = "${self}/nixos-secrets/nixos.enc.yaml";
    secrets."users.fentas.password" = {
      key = "users.fentas.password";
      owner = "root";
      group = "root";
      mode = "0400";
    };
  };

  my-nixos = {
    desktops.hyprland.enable = true;

    hardware = {
      gpu.nvidia.enable = true;
    };

    features = {
      qemu.enable = true;
      bash.enable = true;
      nvchad.enable = true;
      keyd.enable = true;
    };

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
