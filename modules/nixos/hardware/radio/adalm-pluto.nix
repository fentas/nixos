{ pkgs, ... }:
{
  # UDEV rules for PlutoSDR and ADALM2000
  services.udev.extraRules = ''
    # allow "plugdev" group read/write access to ADI PlutoSDR devices
    # DFU Device
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b674", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a32", MODE="0664", GROUP="plugdev"
    # SDR Device
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b673", MODE="0664", GROUP="plugdev"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a02", MODE="0664", GROUP="plugdev"
    # tell the ModemManager (part of the NetworkManager suite) that the device is not a modem, 
    # and don't send AT commands to it
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0456", ATTRS{idProduct}=="b673", ENV{ID_MM_DEVICE_IGNORE}="1"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="2fa2", ATTRS{idProduct}=="5a02", ENV{ID_MM_DEVICE_IGNORE}="1"
  '';

  # iio package for communicating with Pluto
  environment.systemPackages = with pkgs; [
    libiio
    gnuradio
    gqrx
    sdrangel
  ];

  # SSH config for connecting to Pluto
  programs.ssh.extraConfig = ''
    # This is the default ssh_config for the PlutoSDR
    # This file should be located in ~/.ssh/config or /etc/ssh/ssh_config
    # If you update the IP number, you need to do the same in this file
    Host plutosdr
      HostName 192.168.2.1
      UserKnownHostsFile=/dev/null
      HostKeyAlias plutosdr
      StrictHostKeyChecking=no
      CheckHostIP no
      User root
      ChallengeResponseAuthentication no

    # Do the same for zeroconf, so we don't end up with bad keys
    Host pluto.local
            UserKnownHostsFile=/dev/null
            HostKeyAlias plutosdr
            StrictHostKeyChecking=no
            CheckHostIP no
            User root
            ChallengeResponseAuthentication no
  '';

  services.avahi = {
    enable = true;
  };
}
