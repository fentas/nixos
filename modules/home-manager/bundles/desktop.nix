{ pkgs, config, inputs, lib, ... }:
{
  options = {
    myHomeManager.startupScript = lib.mkOption {
      default = "";
      description = "Startup Script";
    };
  };

  config = {
    myHomeManager.alacritty.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      noisetorch
      mpv
    ];
  };
}
