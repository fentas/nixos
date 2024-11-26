# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    vesktop
    prismlauncher

    bottles

    qpwgraph
  ];

  programs.kde-pim = {
    enable = true;
    kmail = true;
    kontact = true;
  };

  programs.partition-manager.enable = true;

}
