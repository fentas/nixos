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

    bottles
  ];

  programs.kde-pim = {
    enable = true;
    kmail = true;
    merkuro = true;
    kontact = true;
  };

}
