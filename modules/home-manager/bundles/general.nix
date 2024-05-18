{ pkgs, config, inputs, lib, ... }:
{
  nixpkgs = {
    config ={
        allowUnfree = lib.mkDefault true;
        experimental-features = lib.mkDefault "nix-command flakes";
    };
  };

  myHomeManager.zsh.enable = lib.mkDefault true;
  myHomeManager.fish.enable = lib.mkDefault true;
  myHomeManager.lf.enable = lib.mkDefault true;
  myHomeManager.nix.enable = lib.mkDefault true;
  myHomeManager.git.enable = lib.mkDefault true;

  programs.home-manager.enable = true;

  programs.lazygit.enable = true;
  programs.bat.enable = true;

  home.packages = with pkgs; [
    qalculate
    tree-sitter
    nh
  ];

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/nixconf";
  }

}