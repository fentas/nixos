{ lib, config, ... }:
{
  config.wayland.windowManager.hyprland = {
    settings = {
      "monitor" = ["DP-1, 2560x1440@144, auto, 1, vrr, 2" "DP-2 2560x1440@60, auto, 1" ", preferred, auto, 1"];
    };
  };

  config.default_monitor = "DP-1";

}
