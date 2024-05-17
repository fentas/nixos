# A Discussion of Installed Software

Because, frankly, I don't really have a list of what I (1) need, (2) want, (3) don't need.

Oh, and I'd like to explain why, for posterity's sake.

I'm a bit confused on if I should install things with nixos or home-manager, especially since there isn't a good reference on if something is
`programs.(program).enable = true;`. So, let's figure out some software.

I'll make a distinction between what I consider "desktop" software and "system" software, as I think this is a good distinction on whether to install
with home-manager or not. I think this boils down to a few factors.

 1) How configurable is the software?
   - If there are home-manager modules for the software, it might be a good idea to install with home-manager.
   - If the software doesn't need configuration (ever), it's likely a good idea to install system wide.
 2) What methods are available?
   - Is the software on Nixpkgs? 
      - If so, is there a nixos module (`programs.${program}.enable`)? Should probably use this method, as there may be additional tweaks.
      - Refer back to 1, if there is a home-manager module then that could be useful
 3) Who will use the software?
   - Well, tbh, I'll be the only user of my computer, likely. But, theoretically, should this software be available to all users?
     - If the software can be used by anyone with little to no configuration, then sure!
       - notable exceptions: neovim, as that is the default text editor on my system. nano will exist too.

The whole reason I'm using NixOS is for immutability -- that is, I don't want to be able to break my system, even intentionally. Software should be installed globally, if at all possible.
I think this means that I want to use home-manager as a nixos module. I'll have to rethink my configuration.

For the sake of this list, and the rest of my sanity, let's follow a rigorous algorithm to determine if something should be installed as a home package or a system package.

Install everything through nixpkgs.

Binaries are installed through NixOS.

Dotfiles are managed by home-manager. Keep exceptions minimal.

I think this is the best solution.


# List of Software

## Format
Columns: Name, Priority (lower number = higher priority), System or User, Module available?

### Priority (P)
0 is the highest priority, get these installed and configured first.

### System or User
Using the guidelines listed above, should this package be available system wide?

### Module
Whether or not a `programs.${program_name}.enable` exists. If yes and I want to use it, then YES. If not, then NO!
If it exists but I don't think its required (or home-manager does it better), then EH!
If home-manager does it better then HM
If I should probably install with a nixos module but configure with HM, then Y&HM.



## The List

### From my most stable, simple config: /etc/nixos

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| firefox       | 0 | System | Default Browser.                     | HM     |
| gtop          | 0 | User   | Fun. Use htop for actual work        | NO!    |
| htop          | 0 | System | Most functional.                     | HM     |
| xclip         | 0 | System | Arguably mandatory for Neovim        | NO!    |
| fzf           | 1 | User   | Haven't got used to using it yet     | HM     |
| fd            | 0 | System | Required for (most) neovim configs   | HM     |
| ripgrep       | 0 | System | "                                    | HM EH  |
| git           | 0 | System | Everyone needs to download things!?! | Y&HM   |
| fastfetch     | 0 | System | Everyone needs to see I RUN NIXOS    | HM     |
| mangohud      | 0 | System | It's a gaming computer.              | HM     |
| protonup      | 0 | System | It's a gaming computer.              | NO!    |
| steam         | 0 | System | It's a gaming computer.              | YES    |
| gamescope     | 0 | System | It's a gaming computer.              | YES    |
| neovim        | 0 | System | Default editor.                      | YES    |
| discord       | 2 | User   | Peice of shit software.              | nixvim |
| prismlauncher | 2 | User   | Minecraft.                           | NO!    |
| vscode        | 1 | System | Alternate Editor                     | HM     |
| lf            | 0 | System | File Explorer                        | HM     |

From here, duplicate package entries are omitted. Each source will only list *additional* entries.

### From my old laptop's configuration.

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| GCC           | 4 | System | C Compiler. Need one for nvim.       | NO!    |
| clang         | 4 | System | C Compiler.                          | NO!    |
| python3       | 4 | System | Python 3.xx.                         | NO!    |
| ~~neofetch~~  | 9 | System | Deprecated.                          | NO!    |
| tmux          | 3 | System | Use zellij? Also in case of tty.     | HM     |
| zellij        | 3 | System | Use tmux?                            | HM     |
| wget          | 5 | System | TBH idk if needs to be permanent     | NO!    |
| curl          | 5 | System | See wget                             | NO!    |
| bintools      | 5 | System | binutils wrapper. use nix develop    | NO!    |
| unzip         | 3 | System | ark doe?                             | NO!    |
| zip           | 3 | System | see unzip                            | NO!    |
| p7zip         | 3 | System | see unzip                            | NO!    |
| unrar         | 3 | System | see unzip                            | NO!    |
| pciutils      | 1 | System | hidden KDE dependency.               | NO!    |
| usbutils      | 1 | System | hidden KDE dependency.               | NO!    |
| goverlay      | 1 | User   | manage mangohud. Does it work?       | NO!    |
| protontricks  | 1 | System | gaming computer                      | NO!    |
| java          | 1 | System | this is for JDK                      | YES    |
| nix-ld (alien)| 1 | System | Check back in with nix-alien.        | FLAKE  |
| btop          | 0 | System | alternative to gtop                  | HM     |
| kitty         | 1 | System | alternative to alacritty             | HM     |
| gnupg         | 1 | System | support PGP keys  :poop: gpg-agent   | YES    |
| gh            | 4 | System | github cli                           | HM     |
| gimp          | 4 | User   | check in on krita?                   | NO!    |
| kicad         | 1 | User   | im an electrical engineer            | NO!    |
| qalculate-qt  | 1 | User   | im an electrical engineer            | NO!    |
| libreoffice   | 1 | User   | gotta be able to write documents     | NO!    |
| hunspell      | 1 | User   | for libreoffice, Dicts.en\_US        | NO!    |


### From Goxore/nixconf (vimjoyer)
What follows is the start of a list of "discovery" packages. Things I've never used, but have seen used elsewhere. I may omit random things.

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| youtube-music | X |        |                                      |        |
| tdesktop      | X |        |                                      |        |
| feh           | X |        |                                      |        |
| noisetorch    | X |        |                                      |        |
| polkit        | X |        |                                      |        |
| polkit gnome  | X |        |                                      |        |
| lxsession     | X |        |                                      |        |
| pulsemixer    | X |        |                                      |        |
| pavucontrol   | X |        |                                      |        |
| adwaita-qt    | X |        |                                      |        |
| pcmanfm       | X |        |                                      |        |
| libnotify     | X |        |                                      |        |
| pywal         | X |        |                                      |        |
| neovide       | X |        |                                      |        |
| ripdrag       | X |        |                                      |        |
| mpv           | X |        |                                      |        |
| sxiv          | X |        |                                      |        |
| zathura       | X |        |                                      |        |
| lm sensors    | X |        |                                      |        |
| upower        | X |        |                                      |        |
| cm unicode    | X |        |                                      |        |
| virt-manager  | X |        |                                      |        |
| wezterm       | X |        |                                      |        |
| onlyoffice-bin| X |        |                                      |        |
| easyeffects   | X |        |                                      |        |
| gegl          | X |        |                                      |        |
| lutris        | X |        |                                      |        |
| protonup-ng   | X |        |                                      |        |
| dxvk          | X |        |                                      |        |
| r2modman      | X |        |                                      |        |
| heroic        | X |        |                                      |        |
| nil           | X |        |                                      |        |
| pistol        | X |        |                                      |        |
| file          | X |        |                                      |        |
| stow          | X |        |                                      |        |
| imagemagick   | X |        |                                      |        |
| killall       | X |        |                                      |        |
| eza           | X |        |                                      |        |
| zoxide        | X |        |                                      |        |
| du-dust       | X |        |                                      |        |
| ffmpeg        | X |        |                                      |        |
| yt-dlp        | X |        |                                      |        |
| tree-sitter   | X |        |                                      |        |
| nh            | X |        |                                      |        |
| lazygit       | X |        |                                      |        |
| bat           | X |        |                                      |        |
| imv           | X |        |                                      |        |
| sxhkd         | X |        |                                      |        |
| xorg.xev      | X |        |                                      |        |
| .xbacklight   | X |        |                                      |        |
| .xhost        | X |        |                                      |        |
| maim          | X |        |                                      |        |
| xdotool       | X |        |                                      |        |
| devour        | X |        |                                      |        |
| ueberzug      | X |        |                                      |        |
| picom-jonaburg| X |        |                                      |        |
| zsh           | X |        |                                      |        |
| pimg          | X |        |                                      |        |
| ctpv          | X |        |                                      |        |
| yazi          | X |        |                                      |        |
| direnv        | X |        |                                      |        |
| stylix        | X |        |                                      | FLAKE  |
| rofi          | X |        |                                      |        |
| chromium      | X |        |                                      |        |
| vesktop       | X |        |                                      |        |
| rbw           | X |        |                                      |        |
| tenacity      | X |        |                                      |        |
| bottom        | X |        |                                      |        |

### From EmergentMind/nix-config

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| remmina       | X |        |                                      |        |
| draw.io       | X |        |                                      |        |
| inkscape      | X |        |                                      |        |
| rpi-imager    | X |        |                                      |        |
| etcher        | X |        |                                      |        |

### From wiltaylor/dotfiles

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| kdenlive      | X |        |                                      |        |
| foot          | X |        |                                      |        |
| dfeet         | X |        |                                      |        |
| pandoc        | X |        |                                      |        |
| krdc          | X |        |                                      |        |
| virtmanager   | X |        |                                      |        |

### From librephoenix/nixos-config

| Name          | P | Scope? | Notes                                | Module |
|---------------|---|--------|--------------------------------------|--------|
| qutebrowser   | X |        |                                      |        |
| libreoffice   | X |        | -fresh                               |        |
| mate.atril    | X |        |                                      |        |
| openboard     | X |        |                                      |        |
| xournalpp     | X |        |                                      |        |
| newsflash     | X |        |                                      |        |
| foliate       | X |        |                                      |        |
| texliveSmall  | X |        |                                      |        |
| numbat        | X |        |                                      |        |
| krita         | X |        |                                      |        |
| pinta         | X |        |                                      |        |
| musikube      | X |        |                                      |        |
| openscad      | X |        |                                      |        |
| obs-studio    | X |        |                                      |        |
| ardour        | X |        |                                      |        |
| rosegarden    | X |        |                                      |        |
| ventoy        | X |        |                                      |        |
| superTuxKart  | X |        |                                      |        |
| pegasus-front | X |        |                                      |        |
| airshipper    | X |        |                                      |        |
| blueman       | X |        |                                      |        |


### Things I found that Could Be Cool (to format later)
 - git LFS (nixos module)
