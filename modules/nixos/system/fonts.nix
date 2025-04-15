{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    corefonts
    noto-fonts
  ];

  fonts.enableDefaultPackages = true;
  fonts.enableGhostscriptFonts = true;
}
