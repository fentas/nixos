{ ... }:
{
  myNixOS = {
    bluetooth.enable = true;
    grub.enable = true;
    nix.enable = true;
    locale.enable = true;
    steelseries.enable = true;
    qemu.enable = true;
    hp-printer.enable = true;

    bundles.users.enable = true;
  };
}
