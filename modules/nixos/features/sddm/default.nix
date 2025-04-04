{ lib, pkgs, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    themeConfig = {
      AccentColor = "#F2F3F4";
      FormPosition = "center";
      Background="${./wallpaper.png}";
    };
  };
in
{
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [sddm-astronaut];
    package = pkgs.kdePackages.sddm;
  };

  environment.systemPackages = [
    sddm-astronaut
  ];
}
