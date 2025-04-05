{ lib, pkgs, ... }:
{
  # The NixOS side of enabling hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  services.hypridle.enable = true;

  programs.hyprlock = {
    enable = true;
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

  services.xserver = {
    xkb = {
      layout = lib.mkDefault "us";
      variant = lib.mkDefault "";
    };
  };

  environment.systemPackages = with pkgs; [
    waybar
    mako
    libnotify
    wofi
    brightnessctl
    udiskie
    hyprpolkitagent
    qt6ct
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
