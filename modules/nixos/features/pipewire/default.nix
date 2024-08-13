{...}:
{
  # sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;


    extraConfig = {
      # pipewire = {
      #   "99-custom-sinks"= {
      #     "context.objects" = [
      #       {
      #         factory = "adapter";
      #         args = {
      #           "factory.name" = "support.null-audio-sink";
      #           "node.name" = "Firefox-Audio";
      #           "node.description" = "All audio from Firefox";
      #           "media.class" = "Audio/Duplex";
      #           "object.linger" = true;
      #           "audio.position" = "[ FL FR ]";
      #           "monitor.passthrough" = true;
      #         };
      #       }
      #     ];
      #   };
      # };
    };

    wireplumber = {
      # extraConfig = {
      #    "log-level-debug" = {
      #      "context.properties" = {
      #        "log.level" = "D";
      #      };
      #   };
      #
      #   "99-auto-link" = {
      #     "wireplumber.components" = [
      #       {
      #         name = "custom/auto-link.lua";
      #         type = "script/lua";
      #         provides = "custom.auto-link";
      #       }
      #     ];
      #     "wireplumber.profiles" = {
      #       main = {
      #         "custom.auto-link" = "required";
      #       };
      #     };
      #   };
      # };
      # extraScripts = {
      #   "custom/auto-link.lua" = builtins.readFile ./auto-link.lua;
      # };
    };
  };
}
