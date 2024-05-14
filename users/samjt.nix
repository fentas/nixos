{ config, pkgs, ... }:

{
  imports = [
    ./configs/samjt
  ];

  home.username = "samjt";
  home.homeDirectory = "/home/samjt";

  home.packages = with pkgs; [
    discord
    prismlauncher
    vscode
    gh
    gimp
    kicad
    hollywood
    qalculate-qt
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
  ];

  programs.git = {
    enable = true;
    userName = "Sw3d15h-F1s4";
    userEmail = "samjt36@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 10;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
