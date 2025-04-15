{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
    # suite
    onlyoffice-bin_latest
    # libreoffice-qt6-fresh
    
    # note taking
    rnote
    
    # PDF viewer
    kdePackages.okular

    # file manager
    nautilus
    file-roller

    # image viewer
    image-roll

    # calculate
    qalculate-gtk
  ];
}
