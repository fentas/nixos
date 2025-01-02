{ pkgs, lib, ... }:
{
  myNixOS = {
    sddm.enable = lib.mkDefault true;
    #plasma5.enable = lib.mkDefault true;

    plasma6.enable = lib.mkDefault true;

    bundles.default-software.enable = lib.mkDefault true;
    bundles.desktop-software.enable = lib.mkDefault true;

    pipewire.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
  };



  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    corefonts
  ];

  fonts.enableGhostscriptFonts = true;

  fonts.enableDefaultPackages = true;
}
