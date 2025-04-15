# Library helper functions adapted from Goxore/nixconf
{inputs}: let
  mylib = (import ./default.nix) {inherit inputs;};
  pkgs-stable = import inputs.nixpkgs-stable { inherit system; config.allowUnfree = true;};
  
  outputs = inputs.self.outputs;
  system = "x86_64-linux";
  lib = inputs.nixpkgs.lib;
in rec {
  # Get the packages for a specific system (ex. "x86_64-linux")
  pkgsFor = sys: inputs.nixpkgs.legacyPackages.${sys};

  # Create a NixOS configuration
  mkSystem = config:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs outputs mylib pkgs-stable;
        self = inputs.self;
      };
      modules = [
        config
        outputs.nixosModules.default
      ];
    };

  # Create a home-manager configuration
  mkHome = config:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {
        inherit inputs outputs mylib;
        self = inputs.self;
      };
      modules = [
        config
        outputs.homeManagerModules.default
      ];
    };


  # Get all files in a directory as a list.
  filesIn = dir: (map (fname: dir + "/${fname}")
    (builtins.attrNames (builtins.readDir dir)));

  # Get all directories in a directory, using a filter.
  dirsIn = dir:
    inputs.nixpkgs.lib.filterAttrs (name: value: value == "directory")
    (builtins.readDir dir);

  # Get the name of the file from the path
  fileNameOf = path: (builtins.head (builtins.split "\\." (baseNameOf path)));

  extendModule = {path, ...} @ args: {pkgs, ...} @ margs: let
    eval = 
      if (builtins.isString path) || (builtins.isPath path)
      then import path margs
      else path margs;
    evalNoImports = builtins.removeAttrs eval ["imports" "options"];

    extra = 
      if (builtins.hasAttr "extraOptions" args) || (builtins.hasAttr "extraConfig" args)
      then [
        ({...}: {
          options = args.extraOptions or {};
          config = args.extraConfig or {};
        })
      ]
      else [];
    in {
      imports = 
        (eval.imports or []) ++ extra;

      options = 
        if builtins.hasAttr "optionsExtension" args
        then (args.optionsExtension (eval.options or {}))
        else (eval.options or {});

      config =
        if builtins.hasAttr "configExtension" args
        then (args.configExtension (eval.config or evalNoImports) margs.config)
        else (eval.config or evalNoImports);
    };

    extendModules = {
      dir,                # Directory to scan (e.g., ./features)
      root ? ["myNixOS"], # Base path for options (e.g., ["myNixOS"] or ["myHomeManager"])
      prefix ? [],        # Sub-path within root (e.g., [] or ["pkgs"])
      default ? false     # Default for the .enable flag
    }:
      let
        enableModulePath = root ++ prefix ++ ["enabled"];
        processModuleFile = f: 
          let
            name = fileNameOf f;
            # e.g., ["myHomeManager", "pkgs", "git", "enable"]
            enableOptionPath = root ++ prefix ++ [name] ++ ["enable"];
            descString = lib.concatStringsSep "." (root ++ prefix ++ [name]);

            # Define the specific extensions for this scheme
            moduleExtensions = {
              extraOptions = lib.attrsets.setAttrByPath
                enableOptionPath
                (lib.mkOption {
                  type = lib.types.bool;
                  default = default;
                  description = "enable the ${descString} configuration";
                });

              configExtension = moduleSpecificConfig: cconfig:
                lib.mkIf 
                  (
                    ( lib.attrByPath enableModulePath false cconfig ) &&
                    ( lib.attrByPath enableOptionPath false cconfig )
                  )
                  moduleSpecificConfig;
            };
          in
            # Use the core 'extendModule' to apply these extensions to the file path 'f'
            extendModule (moduleExtensions // { path = f; }); # Returns the final module function
      in 
        # Return list of processed module functions
        map processModuleFile (filesIn dir);

  addGroups = config: groups: lib.mapAttrs' (userName: userDefFromMyNixOS: {
    # userDefFromMyNixOS is the value from config.myNixOS.users.${userName}
    name = userName; # The user to apply config to
    value = {
      # Define ONLY the extraGroups attribute to be merged
      extraGroups = groups;
      # You could add an mkIf here based on userDefFromMyNixOS if needed, e.g.:
      # extraGroups = lib.mkIf (userDefFromMyNixOS.userSettings.isNormalUser or true) [ "keyd" ];
      # But often simpler to just add it and rely on standard user definition elsewhere.
    };
  }) config.myNixOS.users;

  # forAllSystems = pkgs:
  #   inputs.nixpkgs.lib.genAttrs [
  #     "x86_64-linux"
  #     #"aarch64-linux"
  #     #"x86_64-darwin"
  #     #"aarch64-darwin"
  #     # I don't use the other systems.
  #   ]
  #   (system: pkgs inputs.nixpkgs.legacyPackages.${system});

}
