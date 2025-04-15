{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # video
    celluloid
    vlc
    libvlc

    # music
    gapless
    spotify
  ];
}
