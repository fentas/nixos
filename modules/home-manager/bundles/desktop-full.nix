{ pkgs, lib, ... }:
{
  myHomeManager.bundles.desktop.enable = lib.mkDefault true;
}
