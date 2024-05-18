{ lib, ... }:
#let
#  sddmTheme = import ./sddm-theme.nix {inherit pkgs;};
#in 
{
  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
#   sddm.theme = "${sddmTheme}";
  };

#  Dependencies for sugar-dark theme
#  environment.systemPackages = with pkgs; [
#    libsForQt5.qt5.qtquickcontrols2
#    libsForQt5.qt5.qtgraphicaleffects
#  ];
}
