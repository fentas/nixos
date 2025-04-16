{ pkgs, config, lib, mylib, ... }:
{
  imports = []
    ++ (mylib.extendModules { dir = ./features; default = true; })
  ;

  # NOTE: Managing kwinrc this way overwrites the whole file.
  # More advanced merging is possible using home.file.<path>.text and reading/templating,
  # or potentially the experimental plasma.kconfig options, but managing the source
  # file is often the most reliable starting point.

  # Manage Global Shortcuts
  # 1. COPY ~/.config/kglobalshortcutsrc to e.g. ./dotfiles/kde/kglobalshortcutsrc
  xdg.configFile."kglobalshortcutsrc".source = ./.config/kglobalshortcutsrc; # Adjust path

  # Manage KWin config (includes KWin shortcuts and Krohnkite enabling from above)
  # 1. COPY ~/.config/kwinrc to e.g. ./dotfiles/kde/kwinrc
  xdg.configFile."kwinrc".source = ./.config/kwinrc; # Adjust path

  # Optionally manage kdeglobals if you customized standard shortcuts
  # 1. COPY ~/.config/kdeglobals to e.g. ./dotfiles/kde/kdeglobals
  xdg.configFile."kdeglobals".source = ./.config/kdeglobals; # Adjust path
}