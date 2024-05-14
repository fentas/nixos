{
  description = "Sam's NixOS Config";

  inputs = {

    # Main package source. Stick to unstable for a "rolling release" style.
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };

    # Home manager version. Stick to main branch to follow unstable nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Imports a flake for the anime games.
    aagl = {
     url = "github:ezKEa/aagl-gtk-on-nix";
     inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, aagl, ... }:
  let
    system = "x86_64-linux";
    
  in {
    nixosConfigurations = {
      sam-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
	  ./hosts/sam-desktop.nix

      	  { 
       	    imports = [ aagl.nixosModules.default ];
       	    nix.settings = aagl.nixConfig;
       	    programs.honkers-railway-launcher.enable = true;
       	    programs.honkers-launcher.enable = true;
       	  }
          home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.samjt = import ./users/samjt.nix;
	  }
        ];
      };

      sam-laptop = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./hosts/sam-laptop.nix

	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.samjt = import ./users/samjt.nix;
	  }
	];
      };
    };

  };
}
