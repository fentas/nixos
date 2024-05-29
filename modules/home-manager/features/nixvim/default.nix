{ config, lib, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./options.nix
    ./plugins.nix
    ./keymaps.nix
    ./autocmd.nix
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    enableMan = true;

    colorschemes = {
      tokyonight = {
       enable = false;
      };
      rose-pine = {
        enable = true;
        settings = {
          styles = {
            italic = false;
          };
        };
      };
    };


    clipboard.providers.xclip.enable = true;
  };
}
