# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mpv
    discord
    armcord
    neovide
    vscode
    prismlauncher

    thunderbird
  ];

}
