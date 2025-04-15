{
  description = "fentas nixos";

  inputs = {

    # Main package source. Stick to unstable for a "rolling release" style.
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    # Stable packages, mainly to avoid rebuilds on big packages that don't need updates.
    nixpkgs-stable = {
      url = "nixpkgs/nixos-24.05";
    };

    # Home manager version. Stick to main branch to follow unstable nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Manages neovim through home-manager modules
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Wrapper for nvchad (neovim)
    nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For installing Vivado/Vitis if required.
    # nix-xilinx = {
    #   url = "gitlab:doronbehar/nix-xilinx";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    enhancd = {
      url = "github:babarot/enhancd";
      flake = false;
    };
  };

  outputs = { ... } @ inputs:
  let
    mylib = import ./mylib/default.nix {inherit inputs;};
  in 
   with mylib; {
    nixosConfigurations = {
      dell-9510 = mkSystem ./hosts/dell-9510/configuration.nix;
    };

    homeConfigurations = {
      fentas = mkHome ./users/fentas/home.nix;
    };

    homeManagerModules.default = ./modules/home-manager;
    nixosModules.default = ./modules/nixos;
  };
}
