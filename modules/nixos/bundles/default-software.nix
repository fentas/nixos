{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # Process/system monitors
    gtop
    htop
    btop

    # CLI tools for Neovim
    fzf
    fd
    ripgrep
    clang
    xclip

    # Git
    git
    gh

    # Other CLI tools
    yazi
    fastfetch
    zellij
    eza
    du-dust
    bat

    # nice to have a scripting language
    python312

    # Nix stuff
    nil
    alejandra

    chromium

  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.nh = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.fish.enable = true;

  programs.firefox = {
    enable = true;
  };

  myNixOS = {
    fish.enable = true;
  };

  services.flatpak.enable = true;
}
