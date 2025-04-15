{ pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils

    qpwgraph
  ];

  services.xserver = {
    # enable = lib.mkDefault true;
    xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = lib.mkDefault true;

  programs.partition-manager.enable = true;
}
