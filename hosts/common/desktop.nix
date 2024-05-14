{ config, pkgs, ... }:
{

  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

}
