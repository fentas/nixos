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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    
  in {
    nixosConfigurations = {
      sam-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
	  ./hosts/sam-desktop.nix

      	  { # I'm still a loser.
       	    imports = [ inputs.aagl.nixosModules.default ];
       	    nix.settings = inputs.aagl.nixConfig;
       	    programs.honkers-railway-launcher.enable = true;
       	    programs.honkers-launcher.enable = true;
       	  }
          home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.samjt = import ./users/samjt;
	  }
        ];
      };

#      sam-laptop = nixpkgs.lib.nixosSystem {
#        inherit system;
#	modules = [
#	  ./hosts/sam-laptop.nix
#
#	  home-manager.nixosModules.home-manager {
#	    home-manager.useGlobalPkgs = true;
#	    home-manager.useUserPackages = true;
#	    home-manager.users.samjt = import ./users/samjt;
#	  }
#	];
#      };
    };
  };
}
