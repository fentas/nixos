# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    prismlauncher

    bottles

    qpwgraph

    thunderbird
  ];

  programs.partition-manager.enable = true;

}
