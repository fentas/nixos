# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    vesktop
    prismlauncher

    bottles

    qpwgraph

    thunderbird
  ];

  programs.partition-manager.enable = true;

}
