{ pkgs, lib, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    lazygit.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  services.flatpak.enable = true;

  my-nixos = {
    features = {
      sddm.enable = lib.mkDefault true;
      pipewire.enable = lib.mkDefault true;
    };
  };
}
