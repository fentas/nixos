{ pkgs, lib, ... }:
{
  myNixOS = {
    sddm.enable = lib.mkDefault true;
    plasma5.enable = lib.mkDefault true;
    bundles.default-software.enable = lib.mkDefault true;
    bundles.desktop-software.enable = lib.mkDefault true;

    sound.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
  };



  fonts.packages = with pkgs; [
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono" "Cascadia Code" "Fira Code"];})
    corefonts
    cm_unicode
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
    defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font Mono"];
      sansSerif = ["JetBrainsMono Nerd Font"];
      serif = ["JetBrainsMono Nerd Font"];
    };
  };

  programs.noisetorch.enable = true;
}
