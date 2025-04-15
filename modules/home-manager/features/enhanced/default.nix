{ inputs, pkgs, ... }:
{
  home.packages = [
    pkgs.fzf
  ];
  programs.bash.enable = true;
  programs.bash.initExtra = ''
    # Source the init script from the input's path in the Nix store
    if [ -f "${inputs.enhancd}/init.sh" ]; then
      source "${inputs.enhancd}/init.sh"
    fi
    # Optional: Set ENHANCD_ variables...
  '';
}
