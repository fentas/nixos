{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    onlyoffice-bin_latest
    krita
    gimp
    inkscape
    davinci-resolve
    kicad
    qalculate-qt
    mpv
    discord
    neovide
    vscode
    prismlauncher
    octaveFull
  ];

}
