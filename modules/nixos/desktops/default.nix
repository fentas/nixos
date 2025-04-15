{ pkgs, ... }:
{
  imports = [
    ./system/bluetooth.nix
    ./system/fonts.nix
    ./system/grub.nix
    ./system/locale.nix
    ./system/networking.nix
    ./system/nix.nix
    ./system/printer.nix
    ./system/users.nix
  ];

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

  myNixOS = {
    sddm.enable = lib.mkDefault true;
    pipewire.enable = lib.mkDefault true;
  };
}
