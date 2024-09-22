<h1 align="center">
   <img src="./.github/assets/logo/nixos-logo.png  " width="100px" /> 
   <br>
      Walnut Environment
   <br>
      <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <div align="center">

   <div align="center">
      <p></p>
      <div align="center">
         <a href="https://github.com/zenoix/walnut-environment/">
            <img src="https://img.shields.io/github/repo-size/zenoix/walnut-environment?color=C6A0F6&labelColor=303446&style=for-the-badge&logo=github&logoColor=C6A0F6">
         </a>
         <a = href="https://nixos.org">
            <img src="https://img.shields.io/badge/NixOS-24.05-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
         </a>
         <a href="https://github.com/zenoix/walnut-environment/blob/main/LICENSE">
            <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=313244&colorB=F5A97F&logo=unlicense&logoColor=F5A97F&"/>
         </a>
      </div>
      <br>
   </div>
</h1>

## Screenshots

As at 11/09/2024

![Hyprlock](./.github/assets/screenshots/hyprlock.png)



## Environment


| Type           | Program      |
| :------------- | :----------: |
| Browser         | Firefox |
| Cursor     | Catppuccin Cursor |
| Display Manager     | Sddm |
| Editor         | Neovim |
| Fetch         | Fastfetch |
| File Manager   | Thunar |
| Launcher       | Rofi |
| Lockscreen       | Hypridle + Hyprlock |
| Media Player     | Not yet configured |
| Notification Daemon       | Dunst |
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

README header was modified from [Frost Pheonix's catppuccin config](https://github.com/Frost-Phoenix/nixos-config/blob/catppuccin/README.md)

Rofi was modified from [Sukhmancs' nixos config](https://github.com/sukhmancs/nixos-configs)
