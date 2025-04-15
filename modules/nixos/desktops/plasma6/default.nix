{ pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils

    qpwgraph
  ];

  services = {
    xserver = {
      # enable = lib.mkDefault true;
      xkb = {
        layout = lib.mkDefault "us";
        variant = lib.mkDefault "";
      };
    };
    desktopManager = {
      plasma6.enable = true;
      sddm.wayland.enable = lib.mkDefault true;
    };
  };

  programs.partition-manager.enable = true;
}
