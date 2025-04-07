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
      everforest = {
        enable = true;
        settings = {
          background = "medium";
          enable_italic = 1;
          dim_inactive_windows = 1;
          transparent_background = 1;
        };
      };
    };


    clipboard.providers.wl-copy.enable = true;
  };
}
