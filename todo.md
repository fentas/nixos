# Todo List:

## Research various flakes:
Some 'cool?' flakes I found from scraping dotfiles from Vimjoyer, EmergentMind, LibrePhoenix, Wil Taylor, and Misterio77
These are a list of ones I hadn't heard about before.

first off, nix-community/awesome-nix

- nix-index (nix-community/nix-index)
  - nix-index-database (nix-community/nix-index-database)
  - features
    - command-not-found replacement
    - provides nix-locate, which tells you what nixpkg contains the file.
  - notes
    - seems useful, could add later 

- firefox-addons (gitlab rycee/nur-expressions/pkgs/firefox-addons)
  - features
    - manage firefox addons with nix
  - notes
    - seems complicated, and TBH a little "extra"
    - i use so few firefox plugins anyway that I'm not really worried.

- nix-alien (thiagokokada/nix-alien)
  - features
    - run external binaries on nixos
  - notes
    - probably will install at some point, not a priority yet.

- nix-colors (Misterio77/nix-colors)
  - alternatives
    - base16.nix
    - stylix (danth/stylix)?
  - features
    - provides base16 colors through nix expressions, making things "easier?"
  - notes
    - let's save ricing for after I have a working computer.

- prism (IogaMaster/prism)
  - features
    - applies a LUT to an image based off a selected colorscheme *automagically*
    - uses lutgen to convert wallpapers to your colorscheme
  - notes
    - while the gallery images look ok, i can't imagine this working well
    - good-looking wallpapers are already hard, imagine tone-mapping them automatically
    - not to crap on this guy's work, this has to be difficult to do. it's impressive,
    - but I don't think I'll use it

- hyprland (google the install instructions)
  - hyprland plugins
  - hycov
  - features
    - its a wayland tiler (some would say THE wayland tiler, other than Sway? Idk others.)
    - Talking point.
  - notes
    - i game
    - let's get a nice KDE rice going first since I'm a windows refugee.

- disko (nix-community/disko)
  - features
    - declarative partitioning and formatting
  - notes
    - i've already formatted my disks, and I'm a little scared of overwriting them with
    - some kind of automated tool. Maybe it will help with my laptop??

- impermanence (nix-community/impermanence)
  - see also persist-retro (Geometer1729/persist-retro)
  - features
    - as vimjoyer puts it, "nuke your root on reboot"
  - notes
    - no way. nooo way. i'm way too scared to use this. I like the idea tho.
    - although like, based on how I use my pc, this could work.

- nixos-hardware (NixOS/nixos-hardware)
  - features
    - provides modules for various prebuilts
  - notes
    - my pc is custom built
    - nothing for my laptop (Asus Zephyrus M15 - GU502LU-B17M)
    - maybe once I get better at nixing, I'll add my laptop!

- nix-doom-emacs (nix-community/nix-doom-emacs)
  - warning: broken. See nix-community/nix-straight, marienz/nix-doom-emacs-unstraightened
  - features
    - headaches and a bad time
  - notes
    - was kinda looking forward to this. i wanted to try doom-emacs, but looks like I'll have to do it the old way.

- nix-minecraft
  - my bad: this is for servers, not clients.
  - i use prism launcher for client, it's literally the best thing since sliced bread.

- nix-gaming (fufexan/nix-gaming)
  - features
    - GAMERS! GAMING!
    - fr tho has some modules for games I don't play. Skip!


Now for a few that I know and probably will use
- aagl-gtk-on-nix (ezKEa/aagl-gtk-on-nix)
  - adds the anime game launchers

- nixvim
  - yet another new way to configure neovim. Figured if I'm doing all this work, might as well go all the way right!

- sops-nix
  - secrets management on nixos. Currently learning how to use it.

### New Flake Maybe List
It's always cool to reuse cool code. But only the coolest of code should be used!
Cool flakes:
 - disko
 - nix-colors
 - nix-index
 - nix-alien
No real priority to these anyway. Don't really need em!


## The Grand Restructuring Event
yeah we gotta throw it out and do it again
we can never be satisfied.
the grand vision: multiple machines, expandable to multiple users. Adding new machines should be pretty simple.
you GOTTA have a custom nix function library. How else are you going to brag about your function purity if you haven't written them yourself?
have to be able to flex on the noobs and be like "bro its so easy, just use myLib.foldleftrightcenter''"'forAll and boom its done" (skip rant about bad function names)
get good enough at nix to say that haskell is easy even though i've been an ooper for like my whole life

# File Tree
i think vimjoyer/goxore has the most sensible layout. i'll do something quite similar.
flake.nix
 - inputs
   - nixpkgs (unstable)
   - home-manager (unstable)
   - aagl (unstable)
   - nixvim?
   - nix-colors?
   - sops-nix?
 - outputs
   - nixosConfigurations
   - homeConfigurations

THEY ARE CALLED HOSTS NOW, I GUESS. BACK IN MY DAY WE CALLED EM COMPUTERS. THE CONSEQUENCES OF XSERVER ON ~~MANKIND~~ LINUX USERS.

Hosts directory to hold each host's separate config. For example:
./hosts/sam-desktop/configuration.nix (maybe i change this to just 'desktop' and 'laptop' now?)
./hosts/sam-laptop/configuration.nix (yeah, samjt@sam-laptop is too many sams.)
each one pulls in their own hardware-configuration.nix to keep things simple ig
key thing is that each file here basically enables or disables different module bundles in the common directory.

common directory for (theoretically) portable nix modules. idea being you can enable/disable ones at will perhaps.

Same idea for home-manager users.

Upon further inspection, goxore's version is complex. i guess i'm the haskell noob! clearly it's a monad (or something or other idk i dont haskell)

./nixosModules/whatever for various modules. TBH, i think i'll rename this to modules/nixos and modules/home?
Cool tricks tho to just import all files in a directory.