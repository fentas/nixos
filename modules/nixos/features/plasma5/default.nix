{ pkgs, lib, ... }:
{
  services.xserver = {
    enable = lib.mkDefault true;

    desktopManager.plasma5 = {
      enable = lib.mkDefault true;
    };

    xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
  };
  environment.systemPackages = with pkgs; [
    utterly-nord-plasma
    
    pciutils
    usbutils
  ];
}
