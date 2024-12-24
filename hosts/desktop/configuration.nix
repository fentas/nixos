# For settings specific to desktop
{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  myNixOS = {
    bundles.plasma-desktop.enable = true;
    bundles.users.enable = true;

    bundles.engineering.enable = true;
    bundles.productivity.enable = true;

    amdgpu.enable = true;
    nvidiagpu.enable = false;
    bluetooth.enable = true;
    grub.enable = true;
    steam.enable = true;
    nix.enable = true;
    aagl.enable = true;
    locale.enable = true;

    # adalm-pluto.enable = true;
    steelseries.enable = true;

    matlab.enable = true;
    xilinx.enable = true;
    qemu.enable = true;

    hp-printer.enable = true;

    home-users = {
      sam = {
        userConfig = ../../users/sam/home.nix;
        userSettings = {
          extraGroups = ["networkmanager" "wheel" "dialout" "scanner" "lp" "gamemode"];
          description = "Sam T";
        };
      };
    };

  };

  system.stateVersion = "23.11";
}
