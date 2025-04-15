{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # discord
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    vesktop

    # wine
    bottles
  ];
}
