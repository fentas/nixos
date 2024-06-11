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
i think vimjoyer/goxore has a sensible layout. (note from later: nevermind) i'll do something quite similar.

Upon further inspection, goxore's version is complex. i guess i'm the haskell noob! clearly it's a monad (or something or other idk i dont haskell)

UPDATE: ok so after reading the config further i realized this is ridiculous. It's a mess. And most configs you can find on the internet are!
I don't NEED or WANT anything to do with apple. Neither do I plan on ever using Windows again on desktop (outside a virtual machine (thanks labview, matlab, multisim)).

Most people have an unholy mess of software installed with home-manager or through nixos. ugh, what a mess! Here's a ground rule that I hope to not break:
1) Software is installed and defined through a nix config module
2) Dotfiles and configurations are performed through home-manager
3) System-wide configurations (like sddm, hardware, or something else that makes sense) are performed thruogh nix modules.

Great! As I'm the only user (for now), this isn't an issue. Adding multiple users down the line may require user-local packages, but I'm going to have to check this out more.
Why am I doing this? Because I WANT immutability. I don't want to be able to be a non-root user and do "home-manager switch" and everything is gone. I want to sit through a
full sudo nixos-rebuild, because then I know that I'm intentionally making changes that need to happen (also rollbacks). Home-manager dotfiles can be managed through git, or the
old way, if I don't feel like using home-manager later. I'd like a truly *modular* system, which means I must be able to remove home-manager and still have shit installed.

~~Also, I had a sneaking suspicion that home-manager installs packages in some user local directory as opposed to the nix store (how can it edit nix store without sudo?? on mac?? on other os??).~~
ok turns out this is likely a lie, it's just the user path symlinks to a home-manager folder which I believe eventually links to the nix store, somewhere.
I don't want to pollute my home directory, my install drive is actually quite small (500 GB). Storage upgrades are a money sink, and I just spent 1000 on new CPU and GPU.

There is no such thing as a rule without exceptions. I forsee LSP servers as an exception.

So, I think my structure is going to look something like this:

./flake.nix
./hosts
 -> desktop
   -> configuration.nix - calls various bundles and features
   -> hardware-configuration.nix - boot/filesystem
 -> ./laptop
   -> configuration.nix
   -> hardware-configuration.nix
./users
 -> sam
   -> home.nix - calls various bundles and features
./modules - reusable, separate, redistributable config recipies
 -> nixos (idea stolen from goxore)
   -> bundles - prebuilt recipies
     -> desktop.nix (example) - has every feature I'd want in a desktop.
   -> features - individual program configurations
     -> plasma5.nix (example) - has all options needed for a plasma5 setup.
     -> gnome.nix (example) - has all options needed for a gnome setup.
   -> default.nix (auto-import modules, extend with an enabler)
 -> home-manager
   -> bundles - prebuilt combinations
     -> gaming (example) - has all configs needed for a gaming user
     -> coding (example) - enables my neovim config and installs some LSP?
   -> features - individual program configurations
     -> neovim.nix (example) - has my nixvim config
   -> default.nix (auto-import modules, extend with an enabler)

This way, if I wanted to add a new computer, I can just select what bundles and features it needs.
Also, if I want a new user, I can do the same.

I wonder if I could set up my nixvim config, for example, to be buildable on its own in addition to inside the config?
Allow for some rapid prototyping? I'll have to research nix build.

I plan on using home-manager as a nixos module, rather than standalone. From goxore's config, it appears that you can essentially define both.
In your flake.nix, have homeManagerConfigurations reference your home.nix
In your nixosConfigurations.(system).modules, have home-manager.home-manager (or whatever it is) also reference your home.nix


### What exactly goes into a monad???

So, I've broken everything down into modules. This is great. However, what goes into each module? What is a bundle, if not a feature in the
category of endofunctors? Should bundles exclusively contain references to features? Does this even make sense?

Well, this is basically arbitrary. I've basically become the maintainer of my own NixOS framework, which is both a blessing and a curse.
The blessing being ultimate freedom; the curse being inevitable poor decisions. Therefore, some 'grand vision' design guidelines and rules
(yes the typical whiteboard circlejerk) is required. I'm writing this down because I guarantee I'll wonder HOW and WHY i've done something a certain way.

First off: I don't think EVERYTHING needs to be broken out into its own file. I do like the idea of splitting things into bundles and features tho.
once I figured out what the difference is, at least. It's a bit silly, but I think this keeps things clean-ish.

A feature is a peice of software, configuration, or both. A feature should be focused on one goal and only include settings, options, or packages required
to get said feature to work as I want it to. A feature can be simple or complex; for example having Git on the system with some default configuration could
be a feature, but also an entire KDE environment.

A bundle, on the other hand, is a group of features, settings, or software that are related in some way. For example, I'd consider a bundle of general software
for desktops, including a desktop environment, graphical applications, and the like. I would also consider a bundle of productivity software that I could just
enable or disable, as I might not need a video editor (for example) on every computer. To be honest, this layer of abstraction is a bit, uhh, redundant, as
most apps really don't need a lot of configuration. Especially graphical applications.


BIG TODO: use a stable release branch for things like davinci-resolve so it doesn't have to build every time i update. (DONE)


# current

ok so basically the config works great and its really easy to add to. i'm not sure what to reach for next.

What are some of the things that I should focus on configuring through home-manager?

1) continuously tweak neovim configuration
  a) long-term stretch goal: settle on a colorscheme
  b) decide if said colorscheme should be applied system-wide

## software I can mess with in home-manager:
firefox
fzf
fd
fastfetch
mangohud
vscode (eww)
~lf~ yazi (it has icons mkay)
zellij
alacritty
eza
lazygit
bat

update:
 - added fish plugins, tbh pretty easy

man i really need to pick a colorscheme. there's a ton on base16 but tbh they all have issues.
nord is nice but TOO blue, a dark gray background would look way better
rose-pine is nice in neovim but the purple background hurts my eyes after a while
tokyonight is the ubuntu of colorschemes. it's too boring tbh.

a


