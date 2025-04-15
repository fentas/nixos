{ pkgs, config, mylib, ...}:
{
  environment.systemPackages = with pkgs; [
    keyd
  ];

  # add keyd group to all users
  config.users.groups.keyd = {};
  config.users.users = mylib.addGroups config ["keyd"];
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        # Use '*' to match all keyboards not matched by a more specific entry.
        # Find device IDs using 'sudo keyd monitor' in a terminal.
        ids = [ "*" ];

        # https://github.com/rvaiya/keyd#configuration
        settings = {
          main = {
            capslock = "overload(control, escape)";

            # Make Caps Lock act as a layer switch for layer named 'caps'
            # capslock = "layer(caps)";
          };

          # Maps to the [caps] section (only relevant if using 'layer(caps)' above)
          # caps = {
          #   h = "left";
          #   j = "down";
          #   k = "up";
          #   l = "right";
          #   u = "pageup";
          #   i = "pagedown";
          # };

          "window_class=google-chrome" = { 
            A-h = "browserback";
            A-l = "browserforward";
          };
        };
      };
    };
  };
}
