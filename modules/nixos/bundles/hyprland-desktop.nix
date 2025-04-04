{ lib, ... }:
{
  myNixOS = {
    bundles.main.enable = true;
    sddm.enable = lib.mkDefault true;

    hyprland.enable = true;

    bundles.default-software.enable = lib.mkDefault true;
    bundles.desktop-software.enable = lib.mkDefault true;

    pipewire.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
    fonts.enable = lib.mkDefault true;
  };

}
