# Contains office software, editing software, etc.
{ pkgs, pkgs-stable, ... }:
let
  stable-pkgs = with pkgs-stable; [
    davinci-resolve
  ];
in
{
  environment.systemPackages = with pkgs;[
    onlyoffice-bin_latest
    krita
    gimp
    inkscape
  ] ++ stable-pkgs;

}
