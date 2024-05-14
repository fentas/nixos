{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # neovim
    xclip
    ripgrep
    fd
    fzf

    # cli tools
    gcc
    clang
    lf
    htop
    git
    fastfetch
    zellij
    python3
    wget
    curl
    bintools
    unzip
    zip
    p7zip
    unrar
    pciutils
    usbutils
    gtop

    # for steam
    mangohud
    protonup
    protontricks


    # default desktop apps
    firefox
    mupdf
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

}
