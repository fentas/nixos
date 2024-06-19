{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
    protonup
    protontricks

    lutris
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
