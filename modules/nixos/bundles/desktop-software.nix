# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    vesktop
    prismlauncher

    bottles

    qpwgraph

    thunderbird-latest

    qalculate-gtk
  ];

  programs.partition-manager.enable = true;

}
