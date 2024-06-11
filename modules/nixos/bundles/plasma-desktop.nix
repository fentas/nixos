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
    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode"];})
  ];

  fonts.enableDefaultPackages = true;

  programs.noisetorch.enable = true;
}
