{ ... }:
{
  imports = [
    ./desktop.nix
    ./bootloader.nix
    ./locale.nix
    ./users.nix
    ./nix.nix
    ./software.nix
    ./hardware.nix
  ];
}
