{ ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprcursor.nix
    ./waybar.nix #TODO move to separate feature
    ./wofi.nix   #TODO move to separate feature
    ./mako.nix   #TODO move to separate feature
  ];
}
