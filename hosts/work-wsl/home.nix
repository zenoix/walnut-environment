{
  pkgs,
  work,
  ...
}:
{
  imports = [
    ./../common/home.nix
    ./../work-common/home.nix
  ];

  home = {
    packages = with pkgs; [

    ];
  };

}
