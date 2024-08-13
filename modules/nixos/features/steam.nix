{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    protontricks

    lutris


    # dependencies for steamtinkerlaunch
    gawk
    unzip
    wget
    xdotool
    xorg.xprop
    unixtools.xxd
    xorg.xwininfo
    yad
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  #TODO: don't have a hardcoded path!
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/sam/.steam/root/compatibilitytools.d";
  };
}
