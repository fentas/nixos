{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    google-chrome
    firefox
    chromium
    opera
  ];

  # browser config
  programs = {

  };
}
