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
  ];

  programs.partition-manager.enable = true;

}
