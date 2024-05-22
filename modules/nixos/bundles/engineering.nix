# Software that I use for various EE tasks
{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kicad
    qalculate-qt
    octaveFull
    qucs-s
    ngspice
  ];

}
