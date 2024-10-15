# Software that I use for various EE tasks
{ pkgs, pkgs-stable, ... }:
let 
  stable-pkgs = with pkgs-stable; [
    kicad
  ];
in
{

  environment.systemPackages = with pkgs;[
    qalculate-qt
    qucs-s
    ngspice
    xyce

    (octaveFull.withPackages (ps: with ps; [
      symbolic
    ]))
  ] ++ stable-pkgs;

}
