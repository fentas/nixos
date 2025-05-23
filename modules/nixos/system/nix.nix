{ ... }:
{
    programs = {
      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";

        flake = "/etc/nixos";
      };
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
}
