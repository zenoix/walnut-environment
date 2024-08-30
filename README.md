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
