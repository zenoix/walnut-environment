{ pkgs, personal, ... }:
{
  users.users.${personal.user} = {
    isNormalUser = true;
    description = "${personal.user}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

}
