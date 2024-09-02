# (WIP) walnut-environment

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
Lastly, you'll want to change the host name and username in `flake.nix`, `nixos/configuration.nix`, `home-manager/home.nix`, and the git configuration in `home-manager/modules/git.nix`.

## Credits:

Wallpapers are from reddit:
- [u/Ezellix's Mount Fuji, pink palette [5120x2880]](https://www.reddit.com/r/wallpaper/comments/p4zvb7/mount_fuji_pink_palette_5120x2880/)
- [u/marinemotion's Mount Fuji color palette [3840X2160]](https://www.reddit.com/r/wallpaper/comments/q5qc1v/mount_fuji_color_palette_3840x2160/)
