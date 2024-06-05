{ pkgs, lib, ...}:
{
  programs.fish = {
    enable = lib.mkDefault true;
    interactiveShellInit = ''
      fzf_configure_bindings
    '';
  };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  environment.systemPackages = with pkgs.fishPlugins; [
    fzf-fish
    z
    tide
    autopair
  ];
}
