# ./mylib/users.nix
# This file defines user-related helper functions.
# It expects 'lib' to be passed in as an argument.

{ lib }:

rec { # Use 'rec' if you might add more user helpers later that call each other

  # Creates a NixOS module that, when imported, adds the specified list
  # of groups ('groupsToAdd') to the 'extraGroups' list of all users
  # marked as 'isNormalUser = true;'.
  addGroupsToNormalUsers = groupsToAdd:
    # The function returns a standard NixOS module definition
    { config, lib, ... }: {
      config = {
        # Define users.users using listToAttrs/mapAttrsToList
        users.users = lib.listToAttrs (
          lib.mapAttrsToList (userName: userCfg: {
            # Name for listToAttrs = the username
            name = userName;
            # Value to merge = config snippet for this user
            value = {
              # Define extraGroups for this user. NixOS will concatenate
              # this list with other assignments for the same user.
              extraGroups =
                # Only add the groups if the user is a normal user
                lib.mkIf (userCfg.isNormalUser or false) groupsToAdd;
            };
          # Iterate over the final, merged user configuration map
          }) config.users.users
        );
      };
    }; # End of returned module definition

  # --- Add other user-related helper functions here in the future ---
  # exampleHelper = args: ... ;

}
