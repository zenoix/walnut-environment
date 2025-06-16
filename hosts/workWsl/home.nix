{
  pkgs,
  work,
  ...
}:
{
  imports = [
    ./../common/home.nix
    ./../workCommon/home.nix
  ];

  home = {
    homeDirectory = "/home/${work.user}";
    packages = with pkgs; [

    ];
  };

}
