{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    krita
    gimp
    inkscape
    obs-studio
    kdePackages.kdenlive
  ];
}
