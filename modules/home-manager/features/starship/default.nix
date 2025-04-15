{ config, lib, pkgs, ... }:
{
  # 1. Enable Bash Session Management via Home Manager
  programs.bash.enable = true;

  # 2. Enable the Starship Program
  programs.starship.enable = true;

  # 3. Enable Bash Integration (Usually Automatic)
  # When both programs.bash and programs.starship are enabled,
  # Home Manager typically automatically adds the necessary line
  #   eval "$(starship init bash)"
  # to your managed ~/.bashrc file.
  # programs.starship.enableBashIntegration = true;

  # 4. (Optional) Configure Starship Appearance and Modules
  # Full configuration reference: https://starship.rs/config/
  programs.starship.settings = {
    add_newline = true;
    character = {
      success_symbol = "[➜](bold green)";
      error_symbol = "[✗](bold red)";
    };
    hostname.ssh_only = true;
    git_branch = {
      symbol = "🌱 ";
      style = "bold yellow";
    };
    git_status = {
      style = "italic red";
      disabled = false;
    };
    cmd_duration = {
      min_time = 1000;
      show_milliseconds = false;
      disabled = false;
      style = "bold italic #fca311";
    };
    # nix_shell.disabled = true;
    # python = {
    #   pyenv_version_name = true;
    #   style = "bold #ffb703";
    # };
  };

  # --- Alternative Configuration Method ---
  # programs.starship.config = ''
  #   add_newline = false
  #   [character]
  #   success_symbol = "[❯](bold green)"
  # '';
}
