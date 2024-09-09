# (WIP) walnut-environment

## Environment


| Type           | Program      |
| :------------- | :----------: |
| Browser         | Firefox |
| Cursor     | Catppuccin Cursor |
| Display Manager     | Not yet configured |
| Editor         | Neovim |
| Fetch         | Fastfetch |
| File Manager   | Not yet configured |
| Launcher       | Not yet configured |
| Lockscreen       | Hypridle + Hyprlock |
| Media Player     | Not yet configured |
| Music Player | Spicetify |
| Notification Daemon       | Not yet configured |
| Screen Recorder      | Not yet configured |
| Screenshot Software    | Grim + Slurp + Swappy |
| Shell          | Zsh |
| Status Bar     | Waybar |
| Terminal       | Kitty |
| Terminal Font  | JetBrainsMono |
| Theme         | Catppuccin Mocha |
| Window Manager | Hyprland |

## Layout
```
walnut-environment
├── assets              # Assets used in configurations
├── home-manager        # User specific configurations
├── nixos               # System configurations
├── themes              # Shared stylix configurations (system and user)
├── flake.nix           # Flake (main entry point)
└── flake.lock          # Flake lock file
```

## To set it up:
First clone and place the directory in the right place
```sh
git clone https://github.com/zenoix/walnut-environment
mv walnut-environment $HOME # Config should be placed in ~/
cd $HOME/walnut-environment
```
Then replace the hardware configuration file
```sh
rm nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix nixos/hardware-configuration.nix
```
Next, you'll want to change the values in the `personal` attribute set in `flake.nix`.

Lastly, to rebuild the system, use 
```sh
sudo nixos-rebuild switch --flake ~/walnut-environment
```
and/or for home manager
```sh
home-manager switch --flake ~/walnut-environment
```

These two switch commands are aliased in my home manager configuration to `rb` and `hms` respectively which makes future rebuilding easier. 

## Credits:

Wallpapers are from reddit:
- [u/Ezellix's Mount Fuji, pink palette [5120x2880]](https://www.reddit.com/r/wallpaper/comments/p4zvb7/mount_fuji_pink_palette_5120x2880/)
- [u/marinemotion's Mount Fuji color palette [3840X2160]](https://www.reddit.com/r/wallpaper/comments/q5qc1v/mount_fuji_color_palette_3840x2160/)

Firefox CSS was modified from [mimipile's firefoxCSS repo](https://github.com/mimipile/firefoxCSS)
