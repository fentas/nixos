# Miscellaneous desktop-oriented graphical software.
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mpv
    discord
    neovide
    vscode
    prismlauncher

    thunderbird
  ];

}
