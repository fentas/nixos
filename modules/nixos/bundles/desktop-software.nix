{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    onlyoffice-bin_latest
    krita
    gimp
    inkscape
    danvinci-resolve
    kicad
    qalculate-qt
    mpv
    discord
    neovide
    vscode
    prismlauncher
  ];

}
