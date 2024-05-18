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
    lf
    fastfetch
    zellij
    eza
    zoxide
    du-dust
    bat

    # Nix stuff
    nil
    alejandra

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
}
