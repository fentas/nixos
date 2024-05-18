# For settings specific to desktop
{ config, pkgs, lib, inputs, outputs, system, mylib, ...}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  myNixOS = {
    bundles.plasma-desktop.enable = true;
    bundle.users.enable = true;

    amdgpu.enable = true;
    nvidiagpu.enable = false;
    grub.enable = true;
    steam.enable = true;
    nix.enable = true;
    locale.enable = true;
    aagl.enable = true;

  };

  system.stateVersion = "23.11";
}
