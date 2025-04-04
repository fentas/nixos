{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    corefonts
  ];

  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;
}
