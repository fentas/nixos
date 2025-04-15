{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent #TODO: likely move to separate feature
    brightnessctl
    udiskie
    qt6ct
    hyprswitch #TODO: likely move to separate feature

    kdePackages.breeze
    libsForQt5.breeze-qt5
    kdePackages.breeze-icons
    libsForQt5.breeze-icons

    # Screenshot
    hyprshot
    hyprpicker

    # Wifi settings
    networkmanagerapplet
  ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };
    hyprlock = {
      enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  services = {
    hypridle.enable = true;
    xserver.xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
    gvfs.enable = true;
  };

  security = {
    polkit.enable = lib.mkDefault true;
    pam.services.hyprlock = {};
  };

  systemd.user.services.hyprpolkitagent = {
    description = "Hyprland Polkit Authentication Agent";
    partOf = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    after = ["graphical-session.target"];
    unitConfig = {
      ConditionEnvironment = "WAYLAND_DISPLAY";
    };
    serviceConfig = {
      ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
      Slice = "session.slice";
      TimeoutStopSec="5sec";
      Restart="on-failure";
    };
  };

}
