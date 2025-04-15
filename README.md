My Nix Config
=============

Nix is my first time using Linux. I started around Feb 2024.

# Info
I might forget to update this.

 - WM: Hyprland
 - Bar: Waybar
 - Launcher: Wofi
 - Greeter: SDDM
 - Terminal: Alacritty
 - Editor: neovim
 - Colorscheme: Everforest


More rambling can be found in `./docs`. This contains the ramblings of a beginner Nix user, and hopefully my frustration could be useful to you.


# Goals

 - Keep everything modular, if possible. Keep things self-contained, again if possible.
    - What i mean is every program's config should be one folder/file. I can enable/disable that folder or file and nearly all of the options required to use said software go with it.
 - Install programs system-wide in nix modules, and configure them per-user using home-manager
 - Nixify as much as reasonably possible. Of course, it is sometimes easier to just include a local file (css files for styling, for example).
 - Don't delete old modules. I could easily switch back to them later!

## Fork

Forked from https://github.com/Sw3d15h-F1s4/nixos

Suggestions are always welcome! Feel free to open an issue to ask questions too, but beware I am a linux noob.

