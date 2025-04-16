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
      dir,            # Directory path value (e.g., ./system relative to caller)
      default ? false # Default value for the individual .enable flags
    }:
    let
      # flake base path
      selfPathStr = builtins.toString inputs.self;
      dirPathStr = builtins.toString dir;
      modulesBasePathStr = selfPathStr + "/modules/";

      # e.g., ["my-nixos", "system"] or ["my-home-manager", "features"]
      optionPrefixList = 
        if lib.strings.hasPrefix modulesBasePathStr dirPathStr then
          let
            # e.g., "nixos/system" or "home-manager/features"
            moduleRelativePath = lib.strings.removePrefix modulesBasePathStr dirPathStr;
            # e.g., ["nixos", "system"] or ["home-manager", "features"]
            pathComponents = lib.filter (x: x != "") (lib.splitString "/" moduleRelativePath);

            # Map directory name to option name root
            rawRootDir = lib.elemAt pathComponents 0; # "nixos" or "home-manager"
            subPath = lib.lists.drop 1 pathComponents; # e.g., ["system"] or ["features"]
            optionRoot = "my-" + rawRootDir;
          in [optionRoot] ++ subPath
        else
          throw "extendModules: 'dir' (${dirPathStr}) does not seem to be under '${modulesBasePathStr}'";

      # f is the path to the actual .nix file, e.g. /nix/store/.../modules/nixos/system/users.nix
      processModuleFile = f: 
        let
          name = fileNameOf f;
          # e.g., ["my-nixos", "system", "users", "enable"]
          enableOptionPath = optionPrefixList ++ [name] ++ ["enable"];
          descString = builtins.trace "path ${toString enableOptionPath}" (lib.concatStringsSep "." (optionPrefixList ++ [name]));

          moduleExtensions = {
            extraOptions = lib.attrsets.setAttrByPath enableOptionPath (lib.mkOption {
              type = lib.types.bool;
              description = "Enable the ${descString} configuration module";
              inherit default;
            });

            configExtension = moduleSpecificConfig: config: (
              lib.mkIf
                ( lib.attrByPath enableOptionPath false config )
                moduleSpecificConfig
            );
          };
        in
          # Pass extensions to extendModule helper
          extendModule (moduleExtensions // { path = f; });
    in
      # Map over files found in the dir
      map processModuleFile (filesIn dir);

  addGroups = config: groups: lib.mapAttrs' (userName: userDefFrommy-nixos: {
    # userDefFrommy-nixos is the value from config.my-nixos.users.${userName}
    name = userName; # The user to apply config to
    value = {
      # Define ONLY the extraGroups attribute to be merged
      extraGroups = groups;
      # You could add an mkIf here based on userDefFrommy-nixos if needed, e.g.:
      # extraGroups = lib.mkIf (userDefFrommy-nixos.userSettings.isNormalUser or true) [ "keyd" ];
      # But often simpler to just add it and rely on standard user definition elsewhere.
    };
  }) config.my-nixos.users;

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
