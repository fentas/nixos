{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # system
    coreutils
    dnsutils
    curl

    # hardware
    fwupd

    # networking
    wireshark

    # monitors
    gtop
    htop

    # neovim related
    fzf
    fd
    ripgrep
    clang
    neovide

    # git
    git
    gh

    # file management
    jq
    qq
    yq

    # others
    fastfetch
    zellij
    eza
    bat

    # utils
    unrar
    zip
  ];
}
