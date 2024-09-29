{ pkgs, lib, ... }:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];

    # Due to recent vulnerability (not in nixos-unstable yet)
    # browsed.enable = lib.mkForce false;
  };

  # hotfix to disable systemd-browsed
  systemd.services.cups-browsed = lib.warn "Manually overriding systemd-browsed." lib.mkForce {};

  # Prefer to add printers manually.
  # Re-enable avahi if I can't in future.
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  # };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  environment.systemPackages = with pkgs; [
    kdePackages.skanpage
  ];

}
