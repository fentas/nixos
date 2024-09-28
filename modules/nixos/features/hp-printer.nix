{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.skanlite
  ];

}
