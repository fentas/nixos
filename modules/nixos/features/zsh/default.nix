{ pkgs, lib, ...}:
{
  programs.zsh = {
    enable = true;
    # enableCompletions = true;
    # autosuggestions.enable = true;
    # syntaxHighlighting.enable = true;

    # history.size = 10000;

    # shellAliases = {
    #   ll = "ls -l";
    #   noup = "sudo nixos-rebuild switch";
    # };

    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" ];
    #   theme = "robbyrussell";
    # };

    # antidote = {
    #   enable = true;
    #   plugins = [''
    #     zsh-users/zsh-autosuggestions
    #     ohmyzsh/ohmyzsh path:lib/git.zsh
    #   '']; # explanation of "path:..." and other options explained in Antidote README.
    # };
  };


  environment.systemPackages = with pkgs.fishPlugins; [
    zsh
  ];
}
