# Contains office software, editing software, etc.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    onlyoffice-bin_latest
    krita
    gimp
    inkscape
    davinci-resolve
  ];

}
