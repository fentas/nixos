# Software that I use for various EE tasks
{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kicad
    qalculate-qt
    qucs-s
    ngspice


    (octaveFull.withPackages (ps: with ps; [
      symbolic
    ]))
  ];

}
